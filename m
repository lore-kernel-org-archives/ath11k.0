Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAK07-0007dj-It
 for ath11k@lists.infradead.org; Mon, 24 Aug 2020 21:27:36 +0000
Received: by mail-io1-f68.google.com with SMTP id d18so978827iop.13
 for <ath11k@lists.infradead.org>; Mon, 24 Aug 2020 14:27:34 -0700 (PDT)
Date: Mon, 24 Aug 2020 15:27:32 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/3] dt: bindings: net: update compatible for ath11k
Message-ID: <20200824212732.GA3331346@bogus>
References: <1598287470-1871-1-git-send-email-akolli@codeaurora.org>
 <1598287470-1871-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598287470-1871-2-git-send-email-akolli@codeaurora.org>
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

On Mon, 24 Aug 2020 22:14:28 +0530, Anilkumar Kolli wrote:
> Add IPQ6018 wireless driver support,
> its based on ath11k driver.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
> V3:
>  - Use 'enum' rather than oneOf+const.
> V4:
>  - removed oneOf, use just enum (Rob)
> V5:
>  - Fixes errors in 'make dt_binding_check' (Rob)
> 
>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
