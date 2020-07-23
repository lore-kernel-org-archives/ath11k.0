Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydY5-0007Oz-2F
 for ath11k@lists.infradead.org; Thu, 23 Jul 2020 15:54:21 +0000
Received: by mail-il1-f196.google.com with SMTP id s21so4733592ilk.5
 for <ath11k@lists.infradead.org>; Thu, 23 Jul 2020 08:54:20 -0700 (PDT)
Date: Thu, 23 Jul 2020 09:54:18 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt: bindings: net: update compatible for ath11k
Message-ID: <20200723155418.GA439882@bogus>
References: <1595506264-6393-1-git-send-email-akolli@codeaurora.org>
 <1595506264-6393-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595506264-6393-2-git-send-email-akolli@codeaurora.org>
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

On Thu, 23 Jul 2020 17:41:02 +0530, Anilkumar Kolli wrote:
> Add IPQ6018 wireless driver support,
> its based on ath11k driver.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
> V3:
>  - Use 'enum' rather than oneOf+const.
> V4:
>  - removed oneOf, use just enum (Rob)
> 
>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml: properties:compatible: [{'enum': ['qcom,ipq8074-wifi', 'qcom,ipq6018-wifi']}] is not of type 'object', 'boolean'
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1334839

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
