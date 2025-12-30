Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D293E95A77
	for <ath11k@archiver.kernel.org>; Tue, 30 Dec 2025 11:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrEPvHah/uxfe6p0qlDprcjhiDcFOVlm4ql9K39AZls=; b=rmMM6te8Um5KkpOp5XXjNUB0ks
	Mq8bfVwg+OgrsWnxBUmsfSM4kqFgcIMTbMWMNBH2UNVkGwCAvin6oYOb+8awKOrX5dh8LeltAdGHN
	KqJ5yW8QKgn5bmyL29HNfSLndkJasxdpzx8z5uCfktw+xou5AhJJ/trdFqBClDoL6upOeka/CSp5W
	DYNZ5q78Jv3uHdjek8Skb/hiLx7SRxt43/227ucq8W/AwAtavwVM8YgF5SfJCVjYsyfn7RseXTQZc
	iOw/skmHwQSsu7Mxjw0SHxmbPke+MPEf7sHJnGpoPZunnv9FNltSPzGSV3I6Jpt689kYjv1YAfsJ+
	L/62ufQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYBO-00000004lrN-1qiI;
	Tue, 30 Dec 2025 11:46:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYBL-00000004lqy-3ovG
	for ath11k@lists.infradead.org;
	Tue, 30 Dec 2025 11:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F29343CD8;
	Tue, 30 Dec 2025 11:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965EDC4CEFB;
	Tue, 30 Dec 2025 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767095191;
	bh=H2S4xFFDMmwEe5AURbERbGY52mGbCOue6vEC0fGALhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+O18XVji3qLM8P3PpeX3wCoADHltBsx4eEkn1XUG+P7bQM6LBGi9olQewerhd9OG
	 A6EUXqlnv3IHj+hnqvpyXM2gpdgTYO2yMF9Lu0aEIvyO3V3o6qOgngT2p2cejYuGTp
	 LNGab6MMzyunAKO4erhmv31Cm3yGJUiKN7492YfI9svsjY1LKsgRO3BqKf+MLk5CGi
	 MHXKiPYZeeadYMeH6FvKxbKGP7+JxGrQ27KC14dZwX4+hrLs+cDtvjp7zk+kNVaVrf
	 pW8nKLwNxl62VTGuTAvbL8h8ITx2K1zOOZzybTxyznLnMF1LZR9CUCiR+kXL7cJ1jI
	 920GSFdYmhlIQ==
Date: Tue, 30 Dec 2025 12:46:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jjohnson@kernel.org, ath11k@lists.infradead.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt: bindings: net: ath11k: add IPQ9574 compatible
Message-ID: <20251230-meteoric-singing-kudu-cbfbd9@quoll>
References: <20251228155855.2118792-1-mr.nuke.me@gmail.com>
 <20251228155855.2118792-2-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251228155855.2118792-2-mr.nuke.me@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_034631_974180_C8D4AF6F 
X-CRM114-Status: GOOD (  10.88  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Sun, Dec 28, 2025 at 09:58:51AM -0600, Alexandru Gagniuc wrote:
> Add IPQ9574 device support for ath11k. The schema is identical to
> ipq6018, so add the compatible string where needed.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index c089677702cf1..8293ea29b723e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -17,6 +17,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,ipq9574-wifi
>        - qcom,ipq8074-wifi
>        - qcom,ipq6018-wifi

Although it looks like reverse-sorted, but Qualcomm bindings use always
alphabetical sorting (non-reverse), so please place it after
qcom,ipq8074-wifi.

Same in further places.

Best regards,
Krzysztof


