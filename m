Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E99ACC6B38
	for <ath11k@archiver.kernel.org>; Fri, 16 Oct 2026 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgDyxgu8IDR41V90BIj5qe9X5y5frV/UovMkQLzWCYY=; b=yXg0kJa0Z6Z/sjdzXAbXs5igtE
	u4K3YD+3ZhNfEqf2LD8L7/GFPs1LxO+X51Okfgqpw47OaHxOdryzVnTzuSsS5XQVsDcWwrm25OEYM
	N7o5i+Xcu6GSvDDcavQFUub6aYMAFJoPlgM45ZrUjOxDGNqM73wAOJYe79pXGNTXXIo0C3G8UnX/k
	5QNKexpNyu0EkezqZzWpU0eZWs6UieElyUQKSuZw7umY3CZIOe++YqZH0GaRU/1amNBIhGG1HdAxV
	ZUHtYFEzqxCqhcjiS1/VtA3EIGN9mxX+K8y9EXFILYFwiTX6IUXd9TxCYn+2TKWNHYLcBHNKsfcmb
	WkqQikpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbbR-000000028bn-227o;
	Fri, 16 Oct 2026 06:39:41 +0000
Received: from 4do.net ([2001:41d0:602:1f80::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbbP-000000028b4-0rS4
	for ath11k@lists.infradead.org;
	Fri, 16 Oct 2026 06:39:40 +0000
MIME-Version: 1.0
Date: Fri, 16 Oct 2026 06:39:31 +0000
From: Demeter Barna <me@fromdisposition.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang
 Yu <qiang.yu@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz
 Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi
 <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, devicetree@vger.kernel.org, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/7] wifi: ath11k: enable support for WCN6851
In-Reply-To: <fiuuh6rwohtlmwdiy7cwqee62e7jrtdgii7fklfy7jkgh25yul@mzlefhqgzo55>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
 <20260608-sm8350-wifi-v2-2-efb68f1ff04c@oss.qualcomm.com>
 <fiuuh6rwohtlmwdiy7cwqee62e7jrtdgii7fklfy7jkgh25yul@mzlefhqgzo55>
Message-ID: <850ada71460dc62152218e42e78079c6@fromdisposition.org>
X-Sender: me@fromdisposition.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_233939_415565_A682CC32 
X-CRM114-Status: UNSURE (   5.43  )
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

On 2026-06-11 20:05, Dmitry Baryshkov wrote:
> This crashes with the firmware that came with the board,
> WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ. I will revert to 3
> vdevs for v3.

Same here with a newer firmware, WLAN.HSP.1.1-02922 (2021-11-04),
on a Razer Edge 5G (SM8350, WCN6855 hw1.1; next-20261012 plus a
board DTS that is not upstream yet). With 4 vdevs the firmware
crashes (MHI_CB_EE_RDDM, no WMI ready event). With 2 + 1, as in
v1, Wi-Fi works.

Happy to test v3.

