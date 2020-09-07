Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFKRD-00048S-7Y
 for ath11k@lists.infradead.org; Mon, 07 Sep 2020 16:56:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next] ath11k: fix uninitialized return in
 ath11k_spectral_process_data()
References: <20200619142922.GA267142@mwanda> <87a70vf923.fsf@codeaurora.org>
 <20200622171846.GE4151@kadam>
Date: Mon, 7 Sep 2020 16:56:11 +0000
In-Reply-To: <20200622171846.GE4151@kadam> (Dan Carpenter's message of "Mon,
 22 Jun 2020 20:18:47 +0300")
Message-ID: <01010174697f181b-efa89d13-82cc-409d-82e9-75c87d84cd73-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, kernel-janitors@vger.kernel.org, Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Mon, Jun 22, 2020 at 05:51:16PM +0300, Kalle Valo wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> 
>> > There is a success path where "ret" isn't initialized where we never
>> > have a ATH11K_SPECTRAL_TAG_SCAN_SEARCH and then ret isn't initialized.
>> >
>> > Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> >  drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
>> > index 1c5d65bb411f..bfbf905f7507 100644
>> > --- a/drivers/net/wireless/ath/ath11k/spectral.c
>> > +++ b/drivers/net/wireless/ath/ath11k/spectral.c
>> > @@ -677,7 +677,7 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
>> >  	u32 data_len, i;
>> >  	u8 sign, tag;
>> >  	int tlv_len, sample_sz;
>> > -	int ret;
>> > +	int ret = 0;
>> >  	bool quit = false;
>> 
>> I try to avoid initialising ret variables so I would like find another
>> way. What about doing this (completely untested!) in the end of the
>> function:
>> 
>>         return 0;
>> 
>> err:
>> 	kfree(fft_sample);
>> unlock:
>> 	spin_unlock_bh(&ar->spectral.lock);
>> 	return ret;
>
> I normally avoid it as well...  If I were to redo this patch, I would
> probably do:
>
> 	ret = 0;
> err:
> 	kfree(fft_sample);
> unlock:
> 	spin_unlock_bh(&ar->spectral.lock);
> 	return ret;
>
> Would that be better?

Ah, my proposal was buggy. So yes, this is definitely better :) I
changed now the patch in the pending branch, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=586f8e6779fa75ade112cb48606794e034e0ff1d

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
