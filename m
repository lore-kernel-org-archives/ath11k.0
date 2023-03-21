Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCA7C6FD1D
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPdWV3wbuhRC4sBxC1ZW+ZNscPo+d84sGapigVbMZRE=; b=garEuNCvTg9cXK
	IH48lwmDZgj57bIK/JwC6Y0GPz7NI12bUQ1H64UgwuYn3u35ex66bdfwIGQxe3xJ74g6gd117zD16
	7KQeYt7pIek+GDjEAtY8J7Jjy0ZMzMqJnwJp85Xd0lTUGpgnmFDtcF/UhFGeFqmFeHU6dAHUDv3Hf
	p48Nm49WdLRPGKIA2LHT2smNLIdDbq5lPGa9fGPNrRY1QgiN0z2laFviL0YDQT9HHC5DgU2MS5MY3
	TTlOZBazLMQMBks892J4u4V3B5RkFjWFF7hcJPcgF9iK3tPSR7N7M3LlQr1DKzJbcGoHRM2aEx7BZ
	xt6r+j+7Z7Wjqft3b6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peXht-00BmbY-2d;
	Tue, 21 Mar 2023 08:51:01 +0000
Received: from mail.craftsplex.pl ([162.19.155.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peXhp-00BmXX-2L
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 08:51:00 +0000
Received: by mail.craftsplex.pl (Postfix, from userid 1002)
	id 4611623247; Tue, 21 Mar 2023 08:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftsplex.pl;
	s=mail; t=1679388650;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=b9TkDQJXiGMPksEQJujXf1WVek4a3RFKwFCmVOYRasZmZbcW3xOdv4d9P1kdznpr+
	 38qy5fo8Vj71dtEx5qNkeKdGcaTljY8+YT+odQkuTztI1M8V04vdlw+1cZNr8mYa7D
	 LUKagmAy9WPaI9Sonix+1UgkDpFYVH/pNfPgP5VneBoqtwRrkc4+27WHl7HS7Jdrfy
	 JNBmc+8J/TXUFYrd/ahUdIdhpc+Bhep6gyKm337t9t9CNaS7ARODXwP1d3j3onlXJk
	 rDFyFWpz7h64Yte/omp+TMaeimqzCLu7VR+/MFhexowka3fjVO/j8xHoRW+J+mLXS1
	 QEAmibuY0tJAw==
Received: by mail.craftsplex.pl for <ath11k@lists.infradead.org>; Tue, 21 Mar 2023 08:50:20 GMT
Message-ID: <20230321074500-0.1.51.jb57.0.4mo9fidkb0@craftsplex.pl>
Date: Tue, 21 Mar 2023 08:50:20 GMT
From: "Kamil Tralewski" <kamil.tralewski@craftsplex.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.craftsplex.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_015057_990985_E317C385 
X-CRM114-Status: UNSURE (   0.90  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKUG96ZHJh
d2lhbQpLYW1pbCBUcmFsZXdza2kKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
