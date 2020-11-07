Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJAk-0007qd-B0
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:02:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt: bindings: add new dt entry for ath11k calibration
 variant
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201015131501.1939685-1-sven@narfation.org>
References: <20201015131501.1939685-1-sven@narfation.org>
Message-Id: <20201107080116.2800CC433C8@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:01:16 +0000 (UTC)
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
To: Sven Eckelmann <sven@narfation.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> wrote:

> The bus + qmi-chip-id + qmi-board-id is not enough to identify the correct
> board data file on IPQ6018 based devices. Multiple different boards share
> the same values. Only the original reference designs can currently be
> identified and loaded from the board-2.bin. But these will not result in
> the correct calibration data when combined with the pre-calibration data
> from the device.
> 
> An additional "variant" information has to be provided to select the
> correct board data for a design which was modified by an ODM. This follows
> the same approach as ath10k.
> 
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

77581df8639f dt: bindings: add new dt entry for ath11k calibration variant
14f43c5fca57 ath11k: search DT for qcom,ath11k-calibration-variant

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201015131501.1939685-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
