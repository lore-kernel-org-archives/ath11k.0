Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYJw-000481-UZ
 for ath11k@lists.infradead.org; Wed, 16 Sep 2020 14:22:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k:  Support loading ELF board files.
References: <20200826232044.6799-1-greearb@candelatech.com>
Date: Wed, 16 Sep 2020 17:21:57 +0300
In-Reply-To: <20200826232044.6799-1-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 26 Aug 2020 16:20:44
 -0700")
Message-ID: <874knxkdiy.fsf@codeaurora.org>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> The QCA6390 board I have, model 8291M-PR comes with an ELF board
> file.  To get this to at least somewhat work, I renamed bdwlan.e04
> to 'board.bin' and then added this patch to check for .ELF as
> starting bytes of the board file.  If that is found, use type
> ELF.  After this the driver loads.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> This is on top of recent kvallo ath tree.
>
>  drivers/net/wireless/ath/ath11k/qmi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 91134510364c..f87f1d1564f4 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -1992,6 +1992,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
>  	struct qmi_txn txn = {};
>  	int ret;
>  	const u8 *temp;
> +	int bdf_type = ATH11K_QMI_BDF_TYPE_BIN;
>  
>  	req = kzalloc(sizeof(*req), GFP_KERNEL);
>  	if (!req)
> @@ -2008,6 +2009,15 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
>  	temp = bd.data;
>  	remaining = bd.len;
>  
> +	if (bd.len >= 4) {
> +		char* edata = (char*)(temp);
> +		if (edata[1] == 'E' &&
> +		    edata[2] == 'L' &&
> +		    edata[3] == 'F') {
> +			bdf_type = ATH11K_QMI_BDF_TYPE_ELF;
> +		}
> +	}

Thanks, looks good. Expect that the ELF magic check can be simplified to:

strncmp(edata, ELFMAG, SELFMAG)

But I can send v2, I'll soon send some more QCA6390 patches and I'll
include this to the set.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
