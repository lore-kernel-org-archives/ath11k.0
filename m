Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFeh-0006To-7h
 for ath11k@lists.infradead.org; Mon, 08 Jun 2020 11:09:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 12/12] ath11k: set the multiple bssid hw cap
References: <20200604070952.15481-1-john@phrozen.org>
 <20200604070952.15481-13-john@phrozen.org>
Date: Mon, 08 Jun 2020 14:09:18 +0300
In-Reply-To: <20200604070952.15481-13-john@phrozen.org> (John Crispin's
 message of "Thu, 4 Jun 2020 09:09:52 +0200")
Message-ID: <87ftb5ke5d.fsf@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> This patch sets the SUPPORTS_MULTI_BSSID inside ath11k.
>
> Signed-off-by: John Crispin <john@phrozen.org>

On what hardware and firmware did you test this?

> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -109,8 +109,8 @@ enum {
>  
>  enum {
>  	WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP	= 1,
> -	WMI_HOST_VDEV_FLAGS_TRANSMIT_AP		= 2,
> -	WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP	= 4,
> +	WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP	= 2,
> +	WMI_HOST_VDEV_FLAGS_TRANSMIT_AP		= 4,

I wonder if this is a safe thing to do? Do all firmware branches use
these new values?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
