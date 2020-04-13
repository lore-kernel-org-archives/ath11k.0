Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNyyq-000374-Q1
 for ath11k@lists.infradead.org; Mon, 13 Apr 2020 13:18:30 +0000
MIME-Version: 1.0
Date: Mon, 13 Apr 2020 18:48:25 +0530
From: Sriram R <srirrama@codeaurora.org>
Subject: Re: [bug report] ath11k: handle RX fragments
In-Reply-To: <BY5PR02MB6820A065D360B48F7251CADAF7DD0@BY5PR02MB6820.namprd02.prod.outlook.com>
References: <20200407134115.GA108129@mwanda>
 <BY5PR02MB6820A065D360B48F7251CADAF7DD0@BY5PR02MB6820.namprd02.prod.outlook.com>
Message-ID: <304723517988acc2b595b0b4131546c5@codeaurora.org>
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
To: dan.carpenter@oracle.com, mpubbise@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Hi Dan,

> -----Original Message-----
> From: linux-wireless-owner@vger.kernel.org
> <linux-wireless-owner@vger.kernel.org> On Behalf Of Dan Carpenter
> Sent: Tuesday, April 7, 2020 7:11 PM
> To: mpubbise@codeaurora.org
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
> Subject: [EXT] [bug report] ath11k: handle RX fragments
> 
> Hello Manikanta Pubbisetty,
> 
> The patch 243874c64c81: "ath11k: handle RX fragments" from Mar 16,
> 2020, leads to the following static checker warning:
> 
> drivers/net/wireless/ath/ath11k/dp_rx.c:3365 ath11k_dp_rx_frag_h_mpdu()
> warn: missing error code here? 'ath11k_dp_rx_h_defrag()' failed. 'ret' 
> = '0'
> 
> drivers/net/wireless/ath/ath11k/dp_rx.c
>   3343
> HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
>   3344          }
>   3345
>   3346          if (!rx_tid->last_frag_no ||
>   3347              rx_tid->rx_frag_bitmap !=
> GENMASK(rx_tid->last_frag_no, 0)) {
>   3348                  mod_timer(&rx_tid->frag_timer, jiffies +
>   3349
> ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS);
>   3350                  goto out_unlock;
>                         ^^^^^^^^^^^^^^^
> 
> All these gotos should probably set error codes instead of returning 
> success.

Thanks for pointing out. But, this function was written in this way on 
purpose.
The error retval to caller and error goto's in this function perform 
different cleanups and moving them to caller will only make the caller 
function complex which is better to avoid.

Thanks,
Sriram.R

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
