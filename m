Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv3Xq-0001W5-Vl
 for ath11k@lists.infradead.org; Mon, 13 Jul 2020 18:51:20 +0000
Received: by mail-io1-f65.google.com with SMTP id i4so14596299iov.11
 for <ath11k@lists.infradead.org>; Mon, 13 Jul 2020 11:51:18 -0700 (PDT)
Date: Mon, 13 Jul 2020 12:51:16 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt: bindings: net: update compatible for ath11k
Message-ID: <20200713185116.GB529968@bogus>
References: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
 <1592458104-2961-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592458104-2961-2-git-send-email-akolli@codeaurora.org>
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

On Thu, Jun 18, 2020 at 10:58:22AM +0530, Anilkumar Kolli wrote:
> Add IPQ6018 wireless driver support,
> its based on ath11k driver.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
> V3:
>  - Use 'enum' rather than oneOf+const.
> 
>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index a1717db36dba..b22cde6f3594 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -17,7 +17,11 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,ipq8074-wifi
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,ipq8074-wifi
> +              - qcom,ipq6018-wifi

Just need:

enum:
  - qcom,ipq8074-wifi
  - qcom,ipq6018-wifi

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
