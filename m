Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E654EB64DA
	for <ath11k@archiver.kernel.org>; Thu, 20 Jul 2023 10:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2zKDVuTkl3szS3hYblt7X62p8NoKBFVBs3+FW1ftPQ=; b=Ee8BL8jRjZicka
	Dy6UhQTWnM5bVWqqS9KyWuDO7+/5wLUDHNnWaaT5PgIffLyCWmRXUc87l/OfI1nuFBR6pAD53cQQt
	GAMdIXrsfUDJOphBZFM5bE3feTYeo7wx1SjI3zm3VQ7dldvvHMmZJgmcR3kPXqCL1tvv3Q76eJTwS
	69V1UKVti7YkbsYVfPsU73NMcDd4f4tZdkZxy+h/j+EcBXb2MalXY82uLsvH8EtUXrXGYLN6hMMqU
	R/+u5ZsZG6kjFgOSaRt+pX1wLQCewh9sR3grgqA5VUujiowP1kC2DBqA5gXeApD0GgRRW6Yu7nLw5
	HD7lUwa+bmmUX4vzALWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQVR-00AfdG-2E;
	Thu, 20 Jul 2023 10:03:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQVP-00AfcZ-1j
	for ath11k@bombadil.infradead.org;
	Thu, 20 Jul 2023 10:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Bm7kvP9mjtgWMDTk0x3n9fvdJasu+xrGpL0E8vcP3ks=; b=Dg14FOW2lazXEohV+u8rZ+wfiC
	MYZcp6vvN3zoJ14WHVmo0/3nNEWddyi7dYO3ZkgtMMWTN72D/fxiu5Z47k1tKdAJpx4pb8WvVcpjx
	1TnvwFSC+ISFRNlhh5pY9O+tbjiQCuuEaZ5OBN8ZkM96/Pm38IRVUqoEMLINtpbmubnWiEGx1S03G
	Bwyj0AR1aqEVIK9nglxyXYFotnbWOFoOQ8dHO5gK5BNwWhPWxQAEbgy8GysgKHl0Csk7emMkAmaeP
	+AOzy6lUZ3hsEPIwl1PeGOCly5EfkZZmvb1nnAfv5oXaajq6FDBfv9sAC+E2pIjQTr/ZjElJ9hm1L
	sOYKnrSQ==;
Received: from mail.cassleycruden.pl ([217.61.97.118])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPEe-00FQi2-1V
	for ath11k@lists.infradead.org;
	Thu, 20 Jul 2023 08:42:10 +0000
Received: by mail.cassleycruden.pl (Postfix, from userid 1001)
	id CAC41841B8; Thu, 20 Jul 2023 09:16:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cassleycruden.pl;
	s=mail; t=1689840995;
	bh=Bm7kvP9mjtgWMDTk0x3n9fvdJasu+xrGpL0E8vcP3ks=;
	h=Date:From:To:Subject:From;
	b=alvTCzB6TfWAkAn+tRf0iUja+ZhT1YvWWNrmubY51sfja0mlM2ar8AH2jb0aRp8Go
	 vkeMzlgvKEPR7I0FWO0aE8UekndxN5R9yoxk4u/hLRy8Ay2PrYgDlJGKtd6VVCWou0
	 5ksLS2xnRYC4mh9qtznELS6TLJ+GQ6dbfWoiB627x0b1wDGDckobobwVI56YjlA99P
	 vnZqhYhh4ec9PfTd7wvYfyKzQ1Vh9AfCuyqjjldWHWBJutRSaMYB8ZeaPL9GQOgN67
	 7K2A+nN3IQjYSKvkZIZY3drSuD/ZmJs02df4jz/7/MY954f5ILWJiRvyxeDU4HjIoJ
	 OLHjreVDqmeIQ==
Received: by mail.cassleycruden.pl for <ath11k@lists.infradead.org>; Thu, 20 Jul 2023 08:16:04 GMT
Message-ID: <20230720074501-0.1.6b.cl8y.0.1had3tjv9p@cassleycruden.pl>
Date: Thu, 20 Jul 2023 08:16:04 GMT
From: "Adrian Giermata" <adrian.giermata@cassleycruden.pl>
To: <ath11k@lists.infradead.org>
Subject: Nieaktywna strona www
X-Mailer: mail.cassleycruden.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_094209_053301_3AFF9C29 
X-CRM114-Status: UNSURE (   1.42  )
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

RHppZcWEIGRvYnJ5IQoKd8WCYcWbbmllIHpha2/FhGN6ecWCZW0gYnVkb3fEmSBub3dlaiBzdHJv
bnkgaW50ZXJuZXRvd2VqIGRsYSBmaXJteSBkemlhxYJhasSFY2VqIHcgUGHFhHN0d2EgYnJhbsW8
eS4KCkR6acSZa2kgbm93b2N6ZXNueW0gZnVua2Nqb25hbG5vxZtjaW9tIGkgbmllc3RhbmRhcmRv
d2VqIGtyZWFjamkgdW1vY25pxYJlbSBtYXJrxJkgdGVqIGZpcm15IGRvZGFqxIVjIGplaiB3YXJ0
b8WbY2kgaSB0b8W8c2Ftb8WbY2ksIGt0w7NyZWogc3p1a2FqxIUgS2xpZW5jaS4KClogcHJ6eWpl
bW5vxZtjacSFIG1vZ8SZIG9kd2llZHppxIcgc2llZHppYsSZIFBhxYRzdHdhIGZpcm15IGkgcHJ6
ZWRzdGF3acSHIHN3b2plIHBvcnRmb2xpbyBsdWIgbW9nxJkgemFkendvbmnEhyBpIHBvem5hxIcg
UGHFhHN0d2Egb2N6ZWtpd2FuaWEsIHd0ZWR5IHdzcMOzbG5pZSBwcnplYW5hbGl6dWplbXkgcG90
ZW5jamHFgiB3c3DDs8WCcHJhY3kuIAoKQ3p5IG1vamEgcHJvcG96eWNqYSB3eWRhamUgc2nEmSBh
dHJha2N5am5hPwoKClBvemRyYXdpYW0KQWRyaWFuIEdpZXJtYXRhCgotLSAKYXRoMTFrIG1haWxp
bmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
