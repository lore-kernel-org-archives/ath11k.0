Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfM3a-0005T8-1w
 for ath11k@lists.infradead.org; Wed, 18 Nov 2020 11:55:27 +0000
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 19:55:19 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH] bus: mhi: Remove auto-start option
In-Reply-To: <20201118093107.GC3286@work>
References: <20201118053102.13119-1-manivannan.sadhasivam@linaro.org>
 <877dqjz0bv.fsf@codeaurora.org> <20201118093107.GC3286@work>
Message-ID: <16c430bbd5117a35496f85f4454095b9@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, bbhatt@codeaurora.org, netdev@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2020-11-18 17:31, Manivannan Sadhasivam wrote:
> On Wed, Nov 18, 2020 at 07:43:48AM +0200, Kalle Valo wrote:
>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> 
>> > From: Loic Poulain <loic.poulain@linaro.org>
>> >
>> > There is really no point having an auto-start for channels.
>> > This is confusing for the device drivers, some have to enable the
>> > channels, others don't have... and waste resources (e.g. pre allocated
>> > buffers) that may never be used.
>> >
>> > This is really up to the MHI device(channel) driver to manage the state
>> > of its channels.
>> >
>> > While at it, let's also remove the auto-start option from ath11k mhi
>> > controller.
>> >
>> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> > [mani: clubbed ath11k change]
>> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> 
>> Thanks and feel free to take this to the immutable branch:
>> 
>> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> 
> Patch applied to mhi-ath11k-immutable branch and merged into mhi-next.
> 
> Thanks,
> Mani
> 
Does net/qrtr/mhi.c need changes? I guess now net/qrtr/mhi.c needs to 
call
mhi_prepare_for_transfer() before transfer.

>> 
>> --
>> https://patchwork.kernel.org/project/linux-wireless/list/
>> 
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
