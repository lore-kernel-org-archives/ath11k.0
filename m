Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576B606A31C
	for <ath11k@archiver.kernel.org>; Wed, 28 Oct 2026 18:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RNSVOtBx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyUllI/O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hitj4QOFcCibSfE+C1n0STRxOoEX+U2w2oL8QRXacMw=; b=RNSVOtBxMniZpS
	hEkoOwtwbLTy+UukSPeFEd1Kn6XFzG9DoeQQtDBppP/f1pZODOc3FunpFgjPRllBd5rKhMGSiJ3P/
	OgDNeLj0j7P7VABKrtodOlzqqGyIUh3JF5c26XJeJ7Kob+a8L2ph+fB0Yj5kir9ywkG3nc3I3ukys
	slXLyk0GIo7cU6C2uzovRtGCNv+8wgwR3qHaN0Gxy690TJUWYC8GsbfNhu9OqLTrqAHwjL9mA6N8P
	D5Rg7TMNXtVHmTEBSTslt4dEKUWmylAxj6a8AVsKz8l5YsasdiR6kHUPrPFbd5GclRGVP9x+e85jA
	RTJJ2Nqc/95n2M2CVICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8QB-00000007khu-0d0R;
	Wed, 28 Oct 2026 18:30:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8Q9-00000007kha-0Djv
	for ath11k@lists.infradead.org;
	Wed, 28 Oct 2026 18:30:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBD9D600DA;
	Wed, 28 Oct 2026 18:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44491F01828;
	Wed, 28 Oct 2026 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793212243;
	bh=Hitj4QOFcCibSfE+C1n0STRxOoEX+U2w2oL8QRXacMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UyUllI/Oq03ut5VAP5DhBp53dKT8ftyCH+6Vcrj+r1MUV89cf1VFLrPXtfndw4QfI
	 mvzb2hn49rwcbAUxq9FOuzDRKo8sVqUibIjXCZC7lBrjD4+HE8fAMVzu0yvyzuBE61
	 /WgMLtWIbwIcz+Y+bIuWXa5po9FaJgQ9Tni52STA+Hv+BzDQvtv0l+PEoVmvB5LcLC
	 xbRsXmm7K1yUmX0Iy5qt17qm33pN1+FwVyboLJH41efeirdNZnuEeAj9hLcBF1sWrO
	 yhhYNdNIHvSQLbygJkmhqvSLWXDMkwE5JWDEjRprFvhJXMa7D8nChgM2XbDWOkHo0E
	 qhxzJ7TWMMXiw==
Message-ID: <7708550c-2cd0-45ba-bfa0-e674b3ec7d38@kernel.org>
Date: Wed, 28 Oct 2026 11:30:41 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: net: wireless: qcom,ath11k-pci: add
 QCN9074
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
 Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <b12f9b35def027947e5a4b6328c68d1a70d3c97e.1792761470.git.me@andrei-z.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <b12f9b35def027947e5a4b6328c68d1a70d3c97e.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/2026 6:36 AM, Andrei-Alexandru Bleortu wrote:
> QCN9074 is a PCIe 802.11ax radio that boards such as the IPQ5018-based
> Ubiquiti UniFi U6 Enterprise solder down, two of them on different
> bands. Like the other ath11k PCIe devices, each needs
> qcom,calibration-variant to select its board data. Document its PCI ID.
> 
> No supplies are added: on these boards the radio's rails are fixed and
> not under software control.
> 
> Assisted-by: LLM
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Bjorn, please take with 2/4 through your tree.
Acked-by: Jeff Johnson <jjohnson@kernel.org>


>  .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> index 0162e36579..605ac5e01e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - pci17cb,1101  # QCA6390
>        - pci17cb,1103  # WCN6855
> +      - pci17cb,1104  # QCN9074
>  
>    reg:
>      maxItems: 1


