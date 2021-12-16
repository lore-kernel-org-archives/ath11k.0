Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744B1C433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sLumr5V6F30eXNYHBkUOjDzZsE/xEmW5/Hp7paWjXw=; b=QWOOa0Wrl+aZIG
	dUtHRuUQn29E1czVZ6XrNyvDdXafNb8qyWNzmVup/jV7qlwjsehajCgArpxHc7HsPVxjT/qJnP5gI
	4t7i8PUS5nks1hgcfgP4ZuwTxIFzO8+QdfRUbTpndPar6BPRxHIos/d83S32gOmLQdXRK4tRbBfnv
	xCXK8axzQZVnFTwk1MIbje3zOzLOtCd3odt8OxExOs05p8NOZU2HHLoAR1nusoxDatLPvGMaUH03B
	n36bNdehPqERpWXXShssqHY9A7cdk122MXvLDrR0JAlqf3tF6MiAuAgA0xNWNE8nVjmC1ynNBBb7+
	no6QdX29xkHy9UUumgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxslo-006Nx4-Ol; Thu, 16 Dec 2021 15:34:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxslm-006NwT-4C
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 15:34:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A05D0B8247B;
 Thu, 16 Dec 2021 15:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216B0C36AE4;
 Thu, 16 Dec 2021 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639668846;
 bh=c9OVquxnCbPd7oE5qBrhnnxW3NX2Nl9yQXk5jMs/9Z4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=IvvBTsBqRVXkFpkBp8KpqvGhL1Tfb07SBOZgGe7x37FwVM5+hrvLc2Rn4Uv4Moecy
 iWQA00vSWX0o/FdX0kglT+OXsWXtgKLW4GIbzB6hscfw2N7EwuCm8t35eKOuuelVsy
 TpQdy281lEiXNMb6nSuJ5TpdOPw5QhhkBgZapmfDqdZ3K9iEr8DxT/NQXEV5bMZ8mt
 w4YA7U8cQXWAGRnMOu03+DcQdfi0QBFsgYltFTtQqrHXhJ728yVuhG8SheU7DjEk0s
 ndj/jYXsjLclOpyahtFtfHM8Z8kzzt12jwfL80gdNFKPOZPnuQ1ISP/0bSyvLR1QXX
 8MZJtF3BpGpQA==
MIME-Version: 1.0
Subject: Re: [PATCH v7 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1638789319-2950-1-git-send-email-akolli@codeaurora.org>
References: <1638789319-2950-1-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163966884345.4646.11460460661865754904.kvalo@kernel.org>
Date: Thu, 16 Dec 2021 15:34:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_073410_335707_29875474 
X-CRM114-Status: UNSURE (   7.66  )
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

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> Ath11k firmware uses host DDR memory, DT entry is used to
> reserve host DDR memory regions, send these memory base
> addresses using DT entries.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

77a0a30bb507 dt: bindings: add new DT entry for ath11k PCI device support
6ac04bdc5edb ath11k: Use reserved host DDR addresses from DT for PCI devices

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1638789319-2950-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
