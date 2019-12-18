Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdUC-0001oU-Qx
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:51:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove unnecessary enum scan_priority
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191211192252.35024-1-natechancellor@gmail.com>
References: <20191211192252.35024-1-natechancellor@gmail.com>
Message-Id: <20191218175145.A6CD8C447A9@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:51:45 +0000 (UTC)
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
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, ath11k@lists.infradead.org

Nathan Chancellor <natechancellor@gmail.com> wrote:

> Clang warns:
> 
> drivers/net/wireless/ath/ath11k/wmi.c:1827:23: warning: implicit
> conversion from enumeration type 'enum wmi_scan_priority' to different
> enumeration type 'enum scan_priority' [-Wenum-conversion]
>         arg->scan_priority = WMI_SCAN_PRIORITY_LOW;
>                            ~ ^~~~~~~~~~~~~~~~~~~~~
> 1 warning generated.
> 
> wmi_scan_priority and scan_priority have the same values but the wmi one
> has WMI prefixed to the names. Since that enum is already being used,
> get rid of scan_priority and switch its one use to wmi_scan_priority to
> fix this warning.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Link: https://github.com/ClangBuiltLinux/linux/issues/808
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

509421acab69 ath11k: Remove unnecessary enum scan_priority

-- 
https://patchwork.kernel.org/patch/11286141/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
