Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYJCf-0006ri-93
 for ath11k@lists.infradead.org; Sat, 23 Nov 2019 00:23:10 +0000
Received: by mail-pj1-f68.google.com with SMTP id a16so3751340pjs.13
 for <ath11k@lists.infradead.org>; Fri, 22 Nov 2019 16:23:08 -0800 (PST)
Date: Fri, 22 Nov 2019 18:23:03 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/49] dt: bindings: net: add qcom,ath11k.yaml
Message-ID: <20191123002303.GA23259@bogus>
References: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
 <1573810153-29623-2-git-send-email-kvalo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573810153-29623-2-git-send-email-kvalo@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Fri, 15 Nov 2019 11:28:25 +0200, Kalle Valo wrote:
> ath11k is a driver for Qualcomm IEEE 802.11ax devices. Add a
> bindings document for the driver, first documenting IPQ8074 which is the
> only device ath11k currently supports.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 273 +++++++++++++++++++++
>  1 file changed, 273 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
