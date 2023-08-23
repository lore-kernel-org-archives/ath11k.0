Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB9EE49A0
	for <ath11k@archiver.kernel.org>; Wed, 23 Aug 2023 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZIvtr+TvZyiKe2DrLVHy8WnSTMMwo1dWR+N37xIW04=; b=1A1OwOu47Y9bea
	TS6+kpMEHDhNoQWXFuzQWkc53f0tnMidGBgefjcuXF5WqtE+yK5+G0ZUFRxxeyl2lqFe4Y6RgiUa7
	iTutvqRZ8O7AbOGi2Z9KK2ElJ96DXPdEdxg5rr3CM/m2QeNHst6cqt8pg3n9n9XR2g0eSw57eEJC4
	vV4Ic3l3hr/t8YCKx9fytPVuqtu3fHiq8+JkJfVSC7PHN58BujdzPRNrqirNPokh/5zqfEnwt0xF2
	tEn1T0pZuBkn7fGzaqOCL3jyy/BCyWon25JXdGUUeBcqfppqc3mlkoHYyD/pKNt7I5vCx9JHXGXKt
	HTCmIceyUOgoiV1pIZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoZ4-000oev-1l;
	Wed, 23 Aug 2023 14:10:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoZ1-000oeB-1C;
	Wed, 23 Aug 2023 14:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A31606222C;
	Wed, 23 Aug 2023 14:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BB0C433C7;
	Wed, 23 Aug 2023 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799825;
	bh=sCSCkACIIV+5luaFZRZzJOEAJRlXKDz6di/DkVOvsDU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bPCDcJO6KihhyBinYi6f0UoQfwXYri0SBVixnNwkc9rxJgZVHrkMGDtrwJmoxmUyN
	 q5ZEL1clv1pkXQZLGbtHiKm2skb8Kxk8fOiYvsU8EIq6Nd6n0pZ9C4rpp1b98KxQEY
	 lXFJVgwzBN6i6SFOXiz2Tu/PGfmHk+qQyxGOJ+qNwIIl8dZiEHljqaoaH0+bVLy2vO
	 aMiTeurk6Rc8BzvYg31HoSZf1daVVA8nQARg8M3COngdMc8R7GgwRivo0YE/e29Uex
	 ItA7M0Ab2DFbZr3+SD8q9PUrQg2jSR3GQgEwRw4uI5XWex40NMrfDzkZzBNPuBNmK4
	 NNVOXwVpJPJjw==
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] wifi: ath11k: fix Wvoid-pointer-to-enum-cast
 warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
References: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279982245.1241462.6353860159222182552.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:10:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_071027_455847_AE6C3F5D 
X-CRM114-Status: UNSURE (   6.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> 'hw_rev' is an enum, thus cast of pointer on 64-bit compile test with W=1
> causes:
> 
>   h11k/ahb.c:1124:11: error: cast to smaller integer type 'enum ath11k_hw_rev' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

6763ef191d67 wifi: ath11k: fix Wvoid-pointer-to-enum-cast warning
de43b07db2a1 wifi: ath10k: fix Wvoid-pointer-to-enum-cast warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230810091224.70088-1-krzysztof.kozlowski@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
