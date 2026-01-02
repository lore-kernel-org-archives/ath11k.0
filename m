Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE39FA3758
	for <ath11k@archiver.kernel.org>; Fri,  2 Jan 2026 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOJF7nRLfD3LQ6Qb8ilPntbm93z82Bo02fUsb9OKhUY=; b=kRTo8IyeBjR2jGYcVxW5ppZhu7
	+DLM/MTrc/6e4jpdv8h8wg4S53WnCS75o4SERohSGmzm0BHu1HyMf1lK7oj/l0lwP29sCzhiE5Nsz
	Rm5+Tgxf1TnvJDl4kzem3+SUuPE8dWKCF70sSWj4XOtPM5hgBLC9PD/+0QRET4eyAOZrwB46lMq6x
	F+i3HSguEIS4A2//ECEfaa+a9lhauEkyE9JqsuehZK5ChD9S74R8nNEIR8O8QHw/RPqIRZ0CBzE7D
	5DGGyMgTf6+CBsRIIQVXTQkvxz1hNLGffHlA9dcrNNyYVf6DLViQRx64SjF2I3F2c+BceEHw0mUKp
	0KsCteeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbmWx-00000008irw-16Ey;
	Fri, 02 Jan 2026 21:17:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbmWt-00000008irZ-2swc
	for ath11k@lists.infradead.org;
	Fri, 02 Jan 2026 21:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2BDD41AA4;
	Fri,  2 Jan 2026 21:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7D1C116B1;
	Fri,  2 Jan 2026 21:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767388670;
	bh=Wmy5ed3YGxGb0MZ2kcqjFsdOicrxvlhnA+MzPNdvS0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5xGIv8F6/8OGvVPxvNzX8YceW4K4uHRDomjvOgegHCBjt/GQ+EWb25FTbPoFF0WH
	 sEecm/DwXbS9mjP5EPL4XXnqEp85x/YHC00pR7dMRZfsc4z44Qq05eVwMfmAKlISkG
	 jYHwY5G08vdw25NipaXB52j9MUust7cKUBhG/WD8eMZ7kfaatOZFPMUFFGXIgSVcYR
	 75ChhFFQEK/1bxqn/pMsDRw+VWn/m83Hl+wTXwrG6HFD59jL0M9mtXeb1yI0293z4z
	 OD/bNBZx6pUFr1Nr3GqFCjYs4KYtW1MYvYHasUijUGYqjpt6h3dOiFVI1yV8SHs0e5
	 IyDKA0qX1miAA==
Date: Fri, 2 Jan 2026 15:17:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: wireless: ath11k: Combine two if:then:
 clauses
Message-ID: <176738866889.203763.17293474751487788708.robh@kernel.org>
References: <20251230114835.52504-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230114835.52504-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_131753_143493_0F63269D 
X-CRM114-Status: UNSURE (   7.61  )
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


On Tue, 30 Dec 2025 12:48:36 +0100, Krzysztof Kozlowski wrote:
> Simplify the binding by combining two if:then: clauses which have
> exactly the same conditional part.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 9 ---------
>  1 file changed, 9 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


