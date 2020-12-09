Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmtRx-0000G1-6z
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 06:59:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix "rmmod ath11k_pci" failure after QMI sequence
 fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201120020028.12063-1-bqiang@codeaurora.org>
References: <20201120020028.12063-1-bqiang@codeaurora.org>
Message-Id: <20201209065934.8C799C43463@smtp.codeaurora.org>
Date: Wed,  9 Dec 2020 06:59:34 +0000 (UTC)
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
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Baochen Qiang <bqiang@codeaurora.org> wrote:

> If board.bin file is missing, QMI sequence fails,
> which results in failure of "rmmod ath11k_pci".
> This patch fixes this issue.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01230-QCAHSTSWPLZ_V2_TO_X86-1
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>

Anil submitted an identical patch:

https://patchwork.kernel.org/project/linux-wireless/patch/1606916215-24643-1-git-send-email-akolli@codeaurora.org/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201120020028.12063-1-bqiang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
