Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlfst-0002SU-HY
 for ath11k@lists.infradead.org; Wed, 17 Jun 2020 21:46:16 +0000
Received: by mail-io1-f67.google.com with SMTP id q8so4731303iow.7
 for <ath11k@lists.infradead.org>; Wed, 17 Jun 2020 14:46:15 -0700 (PDT)
Date: Wed, 17 Jun 2020 15:46:13 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt: bindings: net: update compatible for ath11k
Message-ID: <20200617214613.GA2882286@bogus>
References: <1591709581-18039-1-git-send-email-akolli@codeaurora.org>
 <1591709581-18039-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591709581-18039-2-git-send-email-akolli@codeaurora.org>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Tue, Jun 09, 2020 at 07:02:54PM +0530, Anilkumar Kolli wrote:
> Add IPQ6018 wireless driver support,
> its based on ath11k driver.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index a1717db36dba..844edd87be20 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -17,7 +17,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,ipq8074-wifi
> +    oneOf:
> +      - const: qcom,ipq8074-wifi
> +      - const: qcom,ipq6018-wifi

Use 'enum' rather than oneOf+const.

>  
>    reg:
>      maxItems: 1
> -- 
> 2.7.4
> 

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
