Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUcYP-0008TR-Ug
 for ath11k@lists.infradead.org; Mon, 19 Oct 2020 21:18:54 +0000
Received: by mail-oi1-f194.google.com with SMTP id s21so1662021oij.0
 for <ath11k@lists.infradead.org>; Mon, 19 Oct 2020 14:18:53 -0700 (PDT)
Date: Mon, 19 Oct 2020 16:18:50 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt: bindings: add new dt entry for ath11k
 calibration variant
Message-ID: <20201019211850.GA3619287@bogus>
References: <20201015131501.1939685-1-sven@narfation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015131501.1939685-1-sven@narfation.org>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Thu, 15 Oct 2020 15:15:00 +0200, Sven Eckelmann wrote:
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
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
