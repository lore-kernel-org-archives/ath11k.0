Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjF4f-0001gc-N0
 for ath11k@lists.infradead.org; Thu, 11 Jun 2020 04:44:25 +0000
MIME-Version: 1.0
Date: Wed, 10 Jun 2020 21:44:06 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 12/12] ath11k: set the multiple bssid hw cap
In-Reply-To: <20200604070952.15481-13-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
 <20200604070952.15481-13-john@phrozen.org>
Message-ID: <feb3d62d0c2ec9934c03a35779bcc4c3@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-04 00:09, John Crispin wrote:
> This patch sets the SUPPORTS_MULTI_BSSID inside ath11k.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> 
[...]

> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h
> b/drivers/net/wireless/ath/ath11k/wmi.h
> index 548fa05cb1f6..14cffda43ed0 100644
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
>  };
> 
John,

Not sure how you got the above values? Please confirm.

#define VDEV_FLAGS_NON_MBSSID_AP      0x00000001   /* legacy AP */
#define VDEV_FLAGS_TRANSMIT_AP        0x00000002   /* indicate if this 
vdev is transmitting AP */
#define VDEV_FLAGS_NON_TRANSMIT_AP    0x00000004   /* explicitly 
indicate this vdev is non-transmitting AP */
#define VDEV_FLAGS_EMA_MODE           0x00000008   /* vdev is EMA and 
supports multiple beacon profiles. */

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
