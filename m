Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7255C43334
	for <ath11k@archiver.kernel.org>; Wed, 15 Jun 2022 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nn4g4L3nGzvGdGi8sN1rXvX3Jd2kyDbzSzURYpsJck=; b=unMLNc6wYXjaL/
	rqnipmMFdgtTIdfT2ptZLmjJ+y4kB7A6gj8c6AlHO4zG+muEbyUBL7+IN0twO5wo2liHXiXRYHGqG
	dRXx/fiVZsw6Mv8UjmFvSRdl/lOFvl02fMHSdbm4fi7/v0HuI0Ddi3gsl84d3oms6eZ76bwnNfCKr
	f88m5pMrt13a+BHXif7JUpVkc+Lr6uIFUkdM3zalulJS+6qGoXA+iuzXP3HsRdBLVJvaA9YB3AwPX
	vq3t5Tsm+gKiOIHjK+dp6V08HNq42HEUNonglheWxf5EJPl211roXC5u4gL+NA9acF3w7OlZaYjtc
	am0yNup8ng3Htc/RkX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SSl-00EXiD-FY; Wed, 15 Jun 2022 12:49:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SSg-00EXea-6M
	for ath11k@lists.infradead.org; Wed, 15 Jun 2022 12:49:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9E359B81D6D
	for <ath11k@lists.infradead.org>; Wed, 15 Jun 2022 12:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C4C34115;
	Wed, 15 Jun 2022 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655297364;
	bh=BfoK1czbRdfUbda9qNE6nWM1RZzf0KrXxPi8M5/1/Z8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nN5cg9cymPhzO863zBV3eJxzPfGvPY70vfYgDhS+0MLPGzwLGvS8+cNxZYVGLnnMT
	 vpp/XOEWFmbjqC6u2sjsUxVy/NkdXFFO3ZiyMHz6Xn7LAq1k5pV5flaGoWRxA+BzDx
	 1qyf4nYf6w57d1vjxBJoMBQpLbviQIPYp1ecX1oPdYgM6/+MPSSy0FKIQPvSLI6sVk
	 6cYemtpszCeduvXKtxVYmT1DZtIaSIxdEfC4iCNvFXgZodSQ0F4sl4wr5OpVeO86T0
	 uy1T/EFw+69GEZiRyh74C3slVxt10QnHAEzk2zWqrKg/pTmYjToHalstj/XwZt8FMa
	 wJ2EkIDhRYpXQ==
MIME-Version: 1.0
Subject: Re: [PATCH wireless v2 1/2] dt-bindings: net: wireless: ath9k: Change
 Toke as maintainer
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220610133640.10810-1-kvalo@kernel.org>
References: <20220610133640.10810-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165529735900.15724.10187059671742873369.kvalo@kernel.org>
Date: Wed, 15 Jun 2022 12:49:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_054930_433937_62C0C53F 
X-CRM114-Status: UNSURE (   6.18  )
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

S2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IEthbGxlIFZhbG8g
PHF1aWNfa3ZhbG9AcXVpY2luYy5jb20+Cj4gCj4gVG9rZSBub3cgbWFpbnRhaW5zIGF0aDlrIHNv
IHVwZGF0ZSBEVCBiaW5kaW5ncyBhcyB3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEthbGxlIFZh
bG8gPHF1aWNfa3ZhbG9AcXVpY2luYy5jb20+Cj4gQWNrZWQtYnk6IFRva2UgSMO4aWxhbmQtSsO4
cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgoKMiBwYXRjaGVzIGFwcGxpZWQgdG8gd2lyZWxlc3MuZ2l0
LCB0aGFua3MuCgpmNDI0YjFhNmUxYjQgZHQtYmluZGluZ3M6IG5ldDogd2lyZWxlc3M6IGF0aDlr
OiBDaGFuZ2UgVG9rZSBhcyBtYWludGFpbmVyCmMyYjNhMDc1OWM3NiBkdC1iaW5kaW5nczogbmV0
OiB3aXJlbGVzczogYXRoMTFrOiBjaGFuZ2UgS2FsbGUncyBlbWFpbAoKLS0gCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIyMDYxMDEz
MzY0MC4xMDgxMC0xLWt2YWxvQGtlcm5lbC5vcmcvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2Vy
bmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCgot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
