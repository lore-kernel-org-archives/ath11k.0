Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E421E9D826
	for <ath11k@archiver.kernel.org>; Sun,  5 Apr 2026 22:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8RB4gqG23V1+R428bImkibT6w06cbu8D0zL4zZIzdc=; b=tZ4QERA5T0UZeUVwWYzZSZg1UQ
	lGiZdWJwsLvgK+AxEV+SoBgyGEZjt6M4/27GkhYqBVB07VlJHRhqRDEqZqDF8CuGF4y/LQn9kyI6A
	7y3Bw1yL4JD7+3KLRHyDFvKcazG1oMiiOq7V+gx+EsnMIMO7V9dHGRB/dN7rTAeMdh0bHYaIJJoEE
	zg7305e/WKmkL7hLtG6PQEMLPF4GF5CqMum9nnZakCzC1xT2XwGmkFuWraB9YygtlEQoAyGRNa0o3
	Au5SlpHRN7fKztBX1dD9C9ZCVyL93EUGh9x8NsTer3+xQv8ZpqBx9OfDhp9ombtIpyQyrg635TB//
	sCFeZq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9VxZ-00000004WYZ-32Lm;
	Sun, 05 Apr 2026 22:28:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9VxW-00000004WYD-1tAM
	for ath11k@lists.infradead.org;
	Sun, 05 Apr 2026 22:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8013641A87;
	Sun,  5 Apr 2026 22:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D3BC116C6;
	Sun,  5 Apr 2026 22:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775428124;
	bh=sbn7cSt43ByRtf5P3IZPaeZopVX1YvGYKd1MKlCCcAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pSSRAZ6uFllVa4WTmvevDT1RFY0M6Uyk8CQaZjE8TmGJeocgkzazCFH7IhxytBtd5
	 QE+LFHDEyuDgQDzYdwLBR0/ccFzoAQn/Va1m8DKTMyxlF8mZKbNqFpotCYLTdToIZ6
	 h29e0CezOrumd3pcc6+1bagOyoDE7iG8uSf35Wn3HXjhLpAWj7eb3cewwzd+6bclnW
	 a2zYWnYPwOEUPervov4yFvAKC89M4yr9tmJU1LrYC2OOSpYG14Khmmhtged+8hnClv
	 H1g7F7sASIbxBbNnzcw8vMZr0bhCMB47jIPc62YAA8c+SbpE8MWPURDCcKNOG6dC8P
	 PcdnWItiZxY2g==
Message-ID: <b7520942-865a-450f-8b06-1b5cbc95c7c2@kernel.org>
Date: Sun, 5 Apr 2026 15:28:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: net: wireless: ath11k: Document
 WCN6755 WiFi
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_152846_515579_388738CB 
X-CRM114-Status: UNSURE (   6.06  )
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

On 4/3/2026 6:52 AM, Luca Weiss wrote:
> Document the WCN6755 WiFi using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Bjorn, will you take this entire series through your tree?

Acked-by: Jeff Johnson <jjohnson@kernel.org>



