Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMBu8-0004Kr-3x
 for ath11k@lists.infradead.org; Thu, 02 May 2019 13:37:41 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Fix "failed to synchronize setup for vdev" warn
References: <1556081373-12635-1-git-send-email-periyasa@codeaurora.org>
Date: Thu, 02 May 2019 16:37:35 +0300
In-Reply-To: <1556081373-12635-1-git-send-email-periyasa@codeaurora.org>
 (Karthikeyan Periyasamy's message of "Wed, 24 Apr 2019 10:19:33
 +0530")
Message-ID: <87d0l1m0yo.fsf@kamboji.qca.qualcomm.com>
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> writes:

> In ath11k_mac_vdev_stop(), vdev_stop_status get marked after the
> WMI vdev stop success. In concurrent scenario, ath11k_vdev_stopped_event()
> get called before the above mark get enabled in ath11k_mac_vdev_stop().
> which leads to fail vdev stop, since ath11k_get_ar_vdev_stop_status()
> not able to find the vdev_stop_status mark. Enabled the vdev_stop_status
> mark before requesting the WMI vdev stop, so that we ensure vdev_stop_status
> mark get available in all concurrent scenario.
>
> Warn:
> ath11k c000000.wifi1: invalid vdev id in vdev stopped ev 0
> ath11k c000000.wifi1: failed to synchronize setup for vdev 0: -110
> ath11k c000000.wifi1: failed to stop vdev 0: -110
>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Applied.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
