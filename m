Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CBC25B75
	for <ath11k@archiver.kernel.org>; Thu,  6 Jun 2024 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh5uk/4q2BuDZdTkAOfysCrIxV0qmRW5JJp4Uo2Kz1E=; b=CbNctuuKkNr2O3XfZd/CFeaqkK
	405N8nSWAUupQ8Hj2+zuoQyfRvLPLeMPn1achNl3id/2E2N9HQEHaJb2SzoAwhc37BkgUk51MfnCK
	Lupnv2wzuatENFCSiR9XZpHiMdsJAmhIXsVIBGUvqonleCklxXTS9rE0UYH90w3XVNuaR25anI6ha
	ppv5XKToh81RfkGvV5XZvJyI9JaGgvoe7r2RgaRGA0+7VTFb29e5I/Kwm+8UR684meWI3ZvIX2vWk
	tssZhcCP2wndiwnxtzuc4fvocXOvPHK944YYSDshurrPnlbGbEOh1ddmA0pSOVcUAoPs569y0m+Ui
	E46t1dVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDH3-00000009uwN-48vI;
	Thu, 06 Jun 2024 13:35:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDGx-00000009uq8-0CBf;
	Thu, 06 Jun 2024 13:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B8BBCE18A1;
	Thu,  6 Jun 2024 13:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FBFC32786;
	Thu,  6 Jun 2024 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717680915;
	bh=g4hBhRJqi9bIx8jS0ly5UfYBFgfUA6hE9sFgGnJRl6Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MI/8uVeDWYEMCXL7mrddu/F6OFwCew54CFuTZaUQlMzthMjNfGOOnoSkG+XuO3oiK
	 KlhiDnQEyFDVMjoj9ZogtTDeslThV0Ktvx8oJy2fwRE75TzmpOgtADBa+SeIXVdy8Z
	 JDBwZGdUiTxEWsdTi0Vf4T8LkgddhOOca5aV7sEb0RUHdDRfnn0UiGHszoWhCwXUmU
	 vzYZXOYn1aTLPKGglyLUfel9g93KFSA5FZM3zcf81Itkz2TdsG3X5ngihFJTeVTHSU
	 0jcPtaweyEzGobZ+5zHRgAtqT/cFZSRWLhJTknkv3iI5W67WgoWbiKoKx5Rq4nXPoO
	 Ivy0MmpaMFl6g==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org,
  ath12k@lists.infradead.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 0/2] dt-bindings: describe the ath1X modules on QCom
 BT/WLAN chipsets
References: <20240605122106.23818-1-brgl@bgdev.pl>
Date: Thu, 06 Jun 2024 16:35:10 +0300
In-Reply-To: <20240605122106.23818-1-brgl@bgdev.pl> (Bartosz Golaszewski's
	message of "Wed, 5 Jun 2024 14:21:03 +0200")
Message-ID: <878qziqjn5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_063519_527082_9BA38669 
X-CRM114-Status: UNSURE (   8.79  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Here are the two dt-binding patches from the power-sequencing series
> targeting the wireless subsystem. To keep the cover-letter short, I
> won't repeat all the details, they can be found in the cover-letter for
> v8. Please consider picking them up into your tree, they were reviewed
> by Krzysztof earlier.

Is it ok for everyone that I'll take these to our ath.git tree?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

