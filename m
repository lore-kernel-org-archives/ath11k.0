Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A47CCF9F8
	for <ath11k@archiver.kernel.org>; Wed, 12 Nov 2025 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILdVpbZMTUtPn3ikkCWNRoVepJCljp51S16BFGgv3cc=; b=qiJURsToKG9isWccZWg0Yerpya
	t46BFwxyMd+RWWfJh64ZqVEclcQQs82fZqAkKTD4e3PyfrlA4BYfh4kitllyYxLTLFcB3ex00zqak
	H+HdvxUNSWmaMbgYnOAFSrmPPudm5yV0OE1l3c4GcOTv+utt1zsWxlmODO9TKxze7IYPsx2v/bX/Y
	v8PnxqEcUqpDw31t9P0RUs7HjUJPcvvi57TuJ0tN9smANTMX4yvX7SqZXoiKTRLHhgNdA+y4HDaT3
	y+lxCefGBQ5nHfDTGJTuu9/pfR6s3fCfwI5Dtr5Tf8rISag7lsrZUj1FGaSB01saat5rZx7YeJPgm
	LInAaGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9OE-00000008ifE-3MjC;
	Wed, 12 Nov 2025 11:51:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9OC-00000008iei-0qwr;
	Wed, 12 Nov 2025 11:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ILdVpbZMTUtPn3ikkCWNRoVepJCljp51S16BFGgv3cc=;
	t=1762948312; x=1764157912; b=eBDOq90EoxIb0ThQvPxaFyppoaWllc37l+tBSj19RcVwllQ
	n3uVOrAaKn3iiqkL+rgAETXGGfm7jV0vbZjTdxPCCg75XJp8cAEHMOzA31L1+Et459JBfU688dNor
	t4edUiVZpX697BmvUv/NsMeOZMmMOugB1tT8oXL4jGbZGTzAxRHg4vcPbA5BCgVfnANjNLaxWSQKt
	+i7e8n9EwTBhfw/H6K1kqSPY7nbrc2Zosa81Xroc9b7UXx/CmttWr3XNmjzoUYJkgRzmAF2w9VINi
	jzFPIu/3X/j/saEjzGNXfZbISU3HwOnjtQQU01X3kv/0QnUFcCA1Is4EhsQuscJw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vJ9O5-00000001CV6-1Hqc;
	Wed, 12 Nov 2025 12:51:45 +0100
Message-ID: <7d445736914f971bfbf89b3480cd6552434eaf7f.camel@sipsolutions.net>
Subject: Re: pull-request: ath-next-20251111
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Wed, 12 Nov 2025 12:51:43 +0100
In-Reply-To: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
References: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_035152_243646_2493B6DB 
X-CRM114-Status: UNSURE (   5.06  )
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

On Tue, 2025-11-11 at 09:28 -0800, Jeff Johnson wrote:
>=20
> Once pulled into wireless-next, ath-next will fast-forward, and that
> will provide the baseline for merging ath12k-ng into ath-next.

I just sent a PR to net-next with this, so you might want to wait until
that's merged and I pull net-next back, to have all the current net
content as well.

johannes

