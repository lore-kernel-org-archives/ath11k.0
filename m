Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545F3C32793
	for <ath11k@archiver.kernel.org>; Wed, 18 Jan 2023 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m9KRFMX4lyggRoawx3aK+VcOq26tRZTb9TUTlN5yZU0=; b=wZegIjfVWR20SK
	DK6OHRorKuNFUp8QZQ2NMKmIviwozohqtb0xJpQpApaxmzBGWMEK1/Yj600oCnTxJmXRfLntvVbXr
	JZ1vXTX4XYitZrPCsF6SkaVtaB0qkGryLaZ+o6C2Zq7a/N7jAlhqGVDNTlZUinbEzM6dWGoK3IK3C
	aWp8bharcw5e9uC13j/q+P+QjW/HHgbVIUeSlUmiGa37l8skky0vf9+irmG/G8e3iv+mLbQgjscMe
	CazCH6wAW7IfHVe8HCQXjG/ou8T/GuNUDZweXymToQlEhJm6bgrwsA1pp5+52Pyj0JMDkrHqNtuzO
	qcsZyZjDaJ0DrP+xuHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4PQ-0001P9-W1; Wed, 18 Jan 2023 09:07:04 +0000
Received: from mail.craftsplex.pl ([162.19.155.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4PN-0001Lj-P4
	for ath11k@lists.infradead.org; Wed, 18 Jan 2023 09:07:03 +0000
Received: by mail.craftsplex.pl (Postfix, from userid 1002)
	id DB684241F6; Wed, 18 Jan 2023 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftsplex.pl;
	s=mail; t=1674032813;
	bh=PdkZ+v+vYeToqxHIEU5QY3nYNmj0rMl2wCVGcXJWjrM=;
	h=Date:From:To:Subject:From;
	b=xJzDjsYEld3PTX2E2BpfBzZmXpjs7nV+1M8dct3fVW2/QHrVCjYMBfL36HxIEqhva
	 XdYaw91RcaKtYdLmHgLvVBjsy/wz5gZKNB6HDxn9Jri5sXGQS/y5DwU4LF6wF3yaEf
	 i3qUZLk1qpFO9czL4RGQ28BoFiZtHZgt499dUizqx5tlkrXuMY3Fca/i05sYkjnaWh
	 8SF8MrkWokyqQOLwXHy7m1gsDfwMiCl/TK5h+I2c9Wq2Ku0nljM/DZryCUJifnNF7i
	 ICuWE+2orvlcn+xaftG+CHpuqna2yGCQB6+FlnWwte8vyw+nm5niFG4FNceFqbeyKj
	 jJgE94qmMgGuw==
Received: by mail.craftsplex.pl for <ath11k@lists.infradead.org>; Wed, 18 Jan 2023 09:05:44 GMT
Message-ID: <20230118074500-0.1.3s.8i4z.0.ejrwm6z37k@craftsplex.pl>
Date: Wed, 18 Jan 2023 09:05:44 GMT
From: "Kamil Tralewski" <kamil.tralewski@craftsplex.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Zwi=C4=99ksz_zyski_poprzez_pozycjonowanie_?=
X-Mailer: mail.craftsplex.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_010702_094289_0E0EC73C 
X-CRM114-Status: UNSURE (   1.44  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHdpZWR6xIUgUGHFhHN0d28sIMW8ZSBvZHdpZWR6YWrEhWN5IFBh
xYRzdHdhIHN0cm9uxJkgaW50ZXJuZXRvd8SFIEtsaWVuY2kgd3lyYWJpYWrEhSBzb2JpZSBvcGlu
aWUgbyBtYXJjZSB3IGNpxIVndSA1MCBtaWxpc2VrdW5kPwoKT2QgbGF0IHpham11amVteSBzacSZ
IHByb2Zlc2pvbmFsbnltaSB1c8WCdWdhbWkgU0VPLCBrdMOzcmUgcG96d2FsYWrEhSBuYXN6eW0g
S2xpZW50b20gb2JzxYJ1Z2l3YcSHIHdpxJljZWogemxlY2XFhCBpIHdlasWbxIcgbmEgbm93ZSBy
eW5raS4KCk1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgbmFqYmxpxbxzenltIGN6YXNpZT8KCgpQb3pk
cmF3aWFtCkthbWlsIFRyYWxld3NraQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMWsK
