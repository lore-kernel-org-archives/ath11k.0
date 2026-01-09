Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B44DD232F5
	for <ath11k@archiver.kernel.org>; Fri,  9 Jan 2026 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkHEzT7s4IdSNkhAug+RfRqEDgqL6mkbnLBYb3aZADE=; b=48k8lE+SHYXJF1it+jz2AjWcte
	vbsMed0aGmr5j8W+/pg/ejMUMsHmk3lB3ugTlwffGGTzQXKlKf56eOXYOpPplRKZTy0XcDH0fgGnN
	5dkB0WH3tbm5kRuUYmroHBNndxpOXRcpF5ZPbnznW58C9I1D4Yqu1f7ElOAmgVOsS5AB6mjk0mWVE
	EYouc5T0PMfkklcnertCI2y8gz1dDMKq1wOSHdOFbdJWqvwKTlxOXxpK28ztKRL0wKl9d3oLVmJrI
	qt6PunyycmDr4BtM6naHU7/W4pUuoC//nD7ikIIXmqDYXZBdoiH0x5DdRJMznolQVWbDI9QxPNMVL
	PZbgA62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve87Y-00000001vrU-2m4A;
	Fri, 09 Jan 2026 08:45:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve87T-00000001vqg-3aTU
	for ath11k@lists.infradead.org;
	Fri, 09 Jan 2026 08:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D5ED43D72;
	Fri,  9 Jan 2026 08:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4105C4CEF1;
	Fri,  9 Jan 2026 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767948318;
	bh=IRVowPBCW2vlETszGAMTQ3bg2gWLbqEp3pG15VhO8P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmYEV4VDbX1OOFIo0+CAZ5kEyuueYE/C0CcRA7G/q/TMCGGoIuMzMO1VaqWU0iBW1
	 tdWrVhBYcH9q4vRb79EgP1clzWrQQOzsbEmpbV22E+6srHt8aHXmOUnfa4Dt8PTaxm
	 VLuiVj7CpLgXCysZEcjBFHUkxC7pE7mAhLDrdZG2TMy61X/o6ym9DLHrJ2mx0Ts3EZ
	 3yPqAC63mfKClnPuzGjLN/UtCr6/Nu/O0twsyCRceb8L8ZfGE9GPRu3jqZ6vkCxlaW
	 rBLZqAJyFhU1SwSH5FT5X2vpyGKcvNk0aYURkLWMVirM/OUE0C2S13vlcmwn0LpFL1
	 caYElfOVDqNIQ==
Date: Fri, 9 Jan 2026 09:45:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jjohnson@kernel.org, ath11k@lists.infradead.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt: bindings: net: ath11k: add IPQ9574 compatible
Message-ID: <20260109-neon-conscious-gorilla-1c4514@quoll>
References: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
 <20260109044457.3074510-2-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109044457.3074510-2-mr.nuke.me@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_004519_916296_516ABE71 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 08, 2026 at 10:44:53PM -0600, Alexandru Gagniuc wrote:
> Add IPQ9574 device support for ath11k. The schema is identical to
> ipq6018, so add the compatible string where needed.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
> Changes since v1:
>  - place compatible strings after instead of before ipq8074
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


