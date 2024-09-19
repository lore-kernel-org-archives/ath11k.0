Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B244CF3963
	for <ath11k@archiver.kernel.org>; Thu, 19 Sep 2024 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QFR1aBOinw83SxvDL+nVK6pHz2WXSuItcoIjoJWVM9I=; b=pki7KNpL0PEUMbkM+EqN/XHxVr
	tADfdVmqyQbmNxU0EZ9irGpuaLsQ5sTJC/PPPZw0dd8kjCT8dIbb51rALEY+GF6yw7XpqtbJgQSKm
	WHYs02sTFA9jughQsgdGAigOVw3MEG0Ruh8SmFSp8PBDK58oHhubjJ3D2A/wHx0pgRvqqCzjN1Vce
	0GOqoeB1lO92NY+3fl85lzeV05ZS+7ncL2s5GFPjfT8H2bmwOf/xu6yiwbaGH4AGNOVvXjeWrQzg2
	u8rK/oESwVwfLueOjXgGf9SOhlwtk3Lt9/81POdvT/6k1sY3JxQ5bBr2YUW8MegyAS1jBDqdWGZpX
	ke3Q+hqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srMIn-0000000Arbm-1cnt;
	Thu, 19 Sep 2024 18:54:53 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srMIk-0000000AraP-0bu0
	for ath11k@lists.infradead.org;
	Thu, 19 Sep 2024 18:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1726772088; x=1727031288;
	bh=QFR1aBOinw83SxvDL+nVK6pHz2WXSuItcoIjoJWVM9I=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rDy8FF0UffRc9RIKwf9QfBSNwAmR0R2bUf8E1fwAr/muumWe3GmlQzMLJWv7mUFsM
	 UBlg9UGEBAmVY1xUjZDiPoQo9nXi65RXUmjSBGSP1wqB7pap61IBI73hu6joDSnSa9
	 jPOzos7M0FK1hISch5Yb3bb88Br63Mr1xSPBkLhj/l94ggxU+yJdyk66WK6+RuYTxP
	 yqgeu02dSX8zvKJDTmwTIwuUFnCPfAdcn/kcRv4b9apClnZ7xmuQXpZln4VdNxxO6b
	 Ua95iMHk0PlUoPz8iS57hCouEW6b2dY35h0O57FyeYqgAg0AvIcANGbtNjKfM61x8s
	 t3/r926iCo4fg==
Date: Thu, 19 Sep 2024 18:54:45 +0000
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: Drew G <gottagit@pm.me>
Subject: Missing hw2.1 symlink for WCN6855 in the kernel.org linux-firmware repo.
Message-ID: <Wfrop8a7fA9t_i7gKRGWjgRBFd5f33ZojAUWrpnEEj6lhw0ciTgw6uOgXSGBR79ni2LaRvKMnU0FgPRxLum6jlssu-M71_67G1s1afnlmPs=@pm.me>
Feedback-ID: 80000630:user:proton
X-Pm-Message-ID: 1eb7d266e478fb89ba94f352c5ccb398e8cd257f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_115450_355855_BDF51ED0 
X-CRM114-Status: UNSURE (   2.37  )
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

This simple symlink was added over 2 years ago but still hasn't made it int=
o the upstream linux-firmware.git in kernel.org? What is the process to mak=
e this happen as it means WiFi is broken for people who use regularly updat=
e from the kernel.org repo? How often are these upstream files updated with=
 the latest blobs in this codelinaro repo? Thanks

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/c90fba=
f6224b73aaebd523e102fe7c78f6a542ad




