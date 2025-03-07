Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC4DC19F32
	for <ath11k@archiver.kernel.org>; Fri,  7 Mar 2025 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRg5WjQyOgHwbJEzTh9rYU5NaFZCwlH86GeVrX++AN0=; b=RPWFmXitD/7UFywzSYo/Tb9jDi
	NBAhfCCYTwhSl3bK+4aFUzzx66drtcHm4hjeJ2A1ry7XTM1Z3oeRA4wPgD6tac6cEW81IWSyyz6ab
	X60UhRD/DsPOilaKVaiMOyfaoHkyXJ+98tA2AAdF9TUcA3STxqAGGuOG+fbmfepGdQZwk71d9CI15
	miqw/IjjIYtyp0LcrlQVZgzzVNaZv/QD/z+COPlHzb2w8nZsCs/hRR+TldTTsWpnAYUxZm3ih6d7f
	7FI1RSpAy+JnAUshLNWZjMY1k05YFJ4erf0N5D0LDfCfWgwRkbay4tpsJ65CYMpRf/L5lIuyJfkEs
	pPID3Ryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTWY-0000000Dd9P-3pvI;
	Fri, 07 Mar 2025 08:57:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTQX-0000000DcF2-24pE
	for ath11k@lists.infradead.org;
	Fri, 07 Mar 2025 08:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A61FFA455B0;
	Fri,  7 Mar 2025 08:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA53C4CED1;
	Fri,  7 Mar 2025 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741337487;
	bh=vpJCeiOgrIUkNzDLmzUQdmvKE38vOGJtILsPmcYctyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfVtOAt9wH6sxqq51gbzk0XjY/RUpaBfQJBa0YBABWuGeFhQGBKpMBCszkdzv0r6r
	 3w6D9wukUEI3yk3dTlkoD0KDiTHh6lLNyRwkLNiZ5K5usMwN13HHaWpRtvIRfZAl7A
	 r5ozrazsxkHQ0tXYbzyF541qHqAP8uBsdKG/ocyvNndh0VoAjtpj27JtShyF18nbbO
	 WgyRabhjbR8+xfTHihdrM5xwGGHB00xNE5HqQ7ZtFH66a1s02vbBxpcnzMPURIHazs
	 qWD5zHiivXmFUwnN/tfH6ei/VR3IGM9hVLKyujOIX+RkI8Qwk9Z0Ci4q1dL3jnF/yr
	 /BL46ReGi1kjg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tqTQT-000000005jN-2TiY;
	Fri, 07 Mar 2025 09:51:25 +0100
Date: Fri, 7 Mar 2025 09:51:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 2/2] wifi: ath11k: fix HTC rx insufficient length
Message-ID: <Z8qzjeUE1L5GxFq_@hovoldconsulting.com>
References: <20250307040848.3822788-1-quic_miaoqing@quicinc.com>
 <20250307040848.3822788-3-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307040848.3822788-3-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_005129_629515_9381E2E8 
X-CRM114-Status: GOOD (  17.75  )
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

Hi Miaoqing,

and thanks a lot for looking into this.

On Fri, Mar 07, 2025 at 12:08:48PM +0800, Miaoqing Pan wrote:
> A relatively unusual race condition occurs between host software
> and hardware, where the host sees the updated destination ring head
> pointer before the hardware updates the corresponding descriptor.
> When this situation occurs, the length of the descriptor returns 0.

Can you explain how this race comes about?

I worry that you may just be papering over a driver or firmware bug here
so it would be good to understand how the host can see the updated
pointer before the descriptor.

Also do you have any suggestions for how to reproduce this more easily?
Some users of the X13s (aarch64) hit this very frequently, while I've
only seen it a few times. At least one user hit this consistently when
roaming, and another mentioned seeing this while driving his car with
the laptop on (and presumably seeing a lot of APs go by).

> The current error handling method is to increment descriptor tail
> pointer by 1, but 'sw_index' is not updated, causing descriptor and
> skb to not correspond one-to-one, resulting in the following error:
> 
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> To address this problem, temporarily skip processing the current
> descriptor and handle it again next time. However, to prevent this
> descriptor from continuously returning 0, use skb cb to set a flag.
> If the length returns 0 again, this descriptor will be discarded.
> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Please also include:

Reported-by: Johan Hovold <johan+linaro@kernel.org>

> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

Johan

