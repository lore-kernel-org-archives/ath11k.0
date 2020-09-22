Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKcx2-0008A0-Sz
 for ath11k@lists.infradead.org; Tue, 22 Sep 2020 07:43:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Add support spectral scan for IPQ6018
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600236776-4042-1-git-send-email-periyasa@codeaurora.org>
References: <1600236776-4042-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200922074249.062F7C433F1@smtp.codeaurora.org>
Date: Tue, 22 Sep 2020 07:42:49 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> IPQ6018 supported with 4 bytes FFT BIN size. so supported 4 bytes
> parsing logic in FFT report process. since spectral_fft_sz is
> configured as zero in hw_params, spectral is not supported in
> QCA6390 platform.
> 
> Tested-on: IPQ6018 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5cca5fa1c164 ath11k: Add support spectral scan for IPQ6018

-- 
https://patchwork.kernel.org/patch/11778965/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
