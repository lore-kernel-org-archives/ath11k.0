Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFEC433FE
	for <ath11k@archiver.kernel.org>; Mon,  2 May 2022 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8B1QlHEmRiUbmaUgg/A4r8PHDXM0AQAABhVTh8pAOyw=; b=qbXrcCVSC9nAhg
	8/kUIyndilTdBla9STo5Xqxbu0mMTPoHUSNbuMrQdyw6Qo5zAYqmDgtgnKkGgjkePi9oNAhBpiJA7
	WB4+pPN5LdUDKPSSdjvojr//nULGYCLxzBwEByIZ8Gjjt5pp+oVUiPPIgkFWXLZfla1OfbUx/RJIA
	RnZoY8YFVLoY8BNilrVJtbt/uiSOsodxK32sunFLwugWQBU/ZLM8J2yQb/nR2lnPHxXbu8nuIfGkB
	ivfZmIuwUFUsFJN7MBizZEuXafUe617NXeMiXaYpIIJfzsOdvFXWb+Yj+KALsMNkPNZ5LhWHR5aR3
	YhqykUDjd9omRw7uDVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlWaS-001KWH-Cj; Mon, 02 May 2022 13:59:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlWaJ-001KVO-GM
 for ath11k@lists.infradead.org; Mon, 02 May 2022 13:59:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB6B060BA7;
 Mon,  2 May 2022 13:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85F8C385AC;
 Mon,  2 May 2022 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651499970;
 bh=rkki7fnxVJwM629ZKQOfs9gIhaGKzLdyqKlPakAN4hM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=T+BOSzFlGc7iDXXXBtehvAu37zdckd4dI18jZULA+9M2pTdwj5WEJTkd2+Rm/Vayb
 DCbvssOTw4h9PoJf9c4AM/Lblnf3Y1LGkTRAwjWRRhG+owhl3PHr64jKHc4UBd+lL6
 KHr8QtjrWN16Mkq4a5wWAQazkjBrempjMyixCeeCnktOC8Z2co9PF1JZ5yUt1sNPR0
 IDx8rEEZao/MS8ItdrZGGp0t7xMx66vXXdpqxKskkjpYo7ZwXzRmb/w0OZ6ll0piKi
 b+GNFWWk56UG9Fna6JT6VAMoUKmtthhWhyjdSkSrE6+5QaOrBJ0ISgKGrrTR4lWn/g
 2njidFcTA+2wQ==
MIME-Version: 1.0
Subject: Re: [PATCH v7 1/9] dt: bindings: net: add bindings of WCN6750 for
 ath11k
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220429170502.20080-2-quic_mpubbise@quicinc.com>
References: <20220429170502.20080-2-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165149996655.16977.4961291350588382970.kvalo@kernel.org>
Date: Mon,  2 May 2022 13:59:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_065931_628270_5BE6F262 
X-CRM114-Status: GOOD (  13.71  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
> Though being a PCIe based solution, it is not attached to
> the APSS processor (Application Processor SubSystem), it is
> instead attached to another tiny processor called WPSS Q6
> processor (Wireless Processor SubSystem) on the SC7280 MSM,
> where the WLAN firmware runs, and it is the WLAN firmware
> running on the Q6 processor which enumerates WCN6750, as a
> result APPS processor would never know such a device being
> present in the system and would not detect the WCN6750
> hardware unless and otherwise WCN6750 is registered as a
> platform device. This is the reason behind adding WCN6750
> WLAN node in the device tree.
> 
> Add WCN6750 wireless driver support, its based on ath11k driver.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

9 patches applied to ath-next branch of ath.git, thanks.

00fd24089b81 dt: bindings: net: add bindings of WCN6750 for ath11k
92c1858e4399 ath11k: Move parameters in bus_params to hw_params
d1e1edfde035 ath11k: Add HW params for WCN6750
56c8ccf331bd ath11k: Add register access logic for WCN6750
676f8905fff9 ath11k: Fetch device information via QMI for WCN6750
73d3e71306fe ath11k: Add QMI changes for WCN6750
49890d9c93d5 ath11k: HAL changes to support WCN6750
e67ba1973917 ath11k: Datapath changes to support WCN6750
00402f49d26f ath11k: Add support for WCN6750 device

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220429170502.20080-2-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
