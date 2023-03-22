Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28D1C6FD1C
	for <ath11k@archiver.kernel.org>; Wed, 22 Mar 2023 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mRWOXF+3tPTcuwY5cmJFP2R+nzY7z0++cXQEVBDvj/8=; b=3MqBEEbT39O/bm
	57c9bt1i02vGL9Q6gt7r+iMZ3/1/vBBpQvJS4F0YeFHyYaCctqLSmwr2l+7Yl16JEazk9fCqv7ifk
	YyynQ56pyEENXDKRFbRPfhe/UbaCn5lamAtD/3rp+hNCa5OJBQrrVAYyNMJQVG0SN0+j52gOkBQvi
	LIUs6VGWWaqi1Dj0wTypxV8VmyOHiyztPdeLnKk3yKAmyKv4gwtNXpfXIrQjl+wNzTiV+ePHfjfEy
	1Ev12QgyGhA3CRXLeyVo0CD4tA4noeUN15W9Pe9Ij25+fdiFc+3Sx2KUxa9LGx74nyuXBBfnPQwxi
	nNZRte9bo6Iy8IVeUrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peuZN-00FLPr-1z;
	Wed, 22 Mar 2023 09:15:45 +0000
Received: from mail.seiont.pl ([94.177.238.30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peuZJ-00FLJB-39
	for ath11k@lists.infradead.org;
	Wed, 22 Mar 2023 09:15:43 +0000
Received: by mail.seiont.pl (Postfix, from userid 1001)
	id 8493588C65; Wed, 22 Mar 2023 09:12:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=seiont.pl; s=mail;
	t=1679476373; bh=0RBr9VZWoVDHl4huLrLyFadxMoVuqc/Wg5mabCfPKaM=;
	h=Date:From:To:Subject:From;
	b=EwxQqKJFIZc2RFgerX6b0WwUIB9cKceWZqFbxPsxSg6QwJPhgdBeLGL0n7iR31wp0
	 ZySN/8a4x1v8mrkjPpfKGXDu4KlI+d8jRIcB+b5A9ZrwL7iZib9p99yutCULx5iswu
	 8kxDWeT8fpvS4IVqviwz15zdKfXyHcgmeJ2ZEbIHgATRCvVXBgBxKG0e1ytEprNo4T
	 tah90b+D/WKCJbCDAUmTZvliabEL27HGOWXXHQHMOcjoCfDaZwv9r0QQqHCB8SMAT7
	 iMsKpseSXnylTvLlZueeeeLofkiy+GBKARNdkfe3XfFjYDYQfIVNiVa8PC+4Swgo4U
	 3IgSV0MrgL/ig==
Received: by mail.seiont.pl for <ath11k@lists.infradead.org>; Wed, 22 Mar 2023 09:11:25 GMT
Message-ID: <20230322073002-0.1.4g.1s3cl.0.vv5k2mk2e9@seiont.pl>
Date: Wed, 22 Mar 2023 09:11:25 GMT
From: "Jerzy Maciejewski" <jerzy.maciejewski@seiont.pl>
To: <ath11k@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.seiont.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_021542_239294_95BC0CCB 
X-CRM114-Status: UNSURE (   1.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbSBzZXJk
ZWN6bmllCkplcnp5IE1hY2llamV3c2tpCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
