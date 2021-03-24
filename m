Return-Path: <SRS0=tZkC=IW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498C6C433DB
	for <ath11k@archiver.kernel.org>; Wed, 24 Mar 2021 09:12:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C47DD619F9
	for <ath11k@archiver.kernel.org>; Wed, 24 Mar 2021 09:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C47DD619F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5a2CT0BJxRodaaabGqj+8Qw3ztuCY0GsNtVA+Z9kEFY=; b=dr7U9F36K4JWCXwPba4SrTkSS
	yVTe4Y5/Pu259N3VC8DvqL8HOkgqBV3LNT7Fj4pPhBbJeRMAXUSnbGHbQFOYN0NLrBswfpfU0KM3B
	DCVh/kqBOkI4eCSYfPtBGkTYGSb2G8sE4GBQMuWUR5oB+H3tcV4BN4NSbp/JmBztNqEI/hu/FrDXt
	xBZ0s5cuu8yh4WHeBUzB6CLsBGeQfKIb9E5W1xOC4vrfbS9yQO9Dt0RNXtKo/TFuze8/3ZHXRenNM
	Ljr+YDcw2H3nOLDQWG3708NUG/aVbRJ9+hcbfP3p8PnCjhbKjtYHIlI2L8hG9VTGsS8cm0GWK+xBZ
	MxxgH/Vfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOzYl-00GhLQ-RN; Wed, 24 Mar 2021 09:12:16 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOzYV-00GhHb-N7
 for ath11k@lists.infradead.org; Wed, 24 Mar 2021 09:12:02 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-70-F_iQyAaGNv6_r3BEezM2zQ-1; Wed, 24 Mar 2021 09:11:56 +0000
X-MC-Unique: F_iQyAaGNv6_r3BEezM2zQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 09:11:55 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 24 Mar 2021 09:11:55 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Sebor' <msebor@gmail.com>, Ingo Molnar <mingo@kernel.org>, "Arnd
 Bergmann" <arnd@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Martin
 Sebor" <msebor@gcc.gnu.org>, Ning Sun <ning.sun@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Jani Nikula <jani.nikula@linux.intel.com>, Kalle Valo
 <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>, James Smart
 <james.smart@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>, Serge Hallyn
 <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "tboot-devel@lists.sourceforge.net"
 <tboot-devel@lists.sourceforge.net>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "cgroups@vger.kernel.org"
 <cgroups@vger.kernel.org>, "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>
Subject: RE: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Thread-Topic: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Thread-Index: AQHXH2fn7jNrPkUb50e9k3rL2a+D9qqS2/oQ
Date: Wed, 24 Mar 2021 09:11:55 +0000
Message-ID: <0aa198a1dd904231bcc29454bf19a812@AcuMS.aculab.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
 <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
In-Reply-To: <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_091200_546955_B6585E37 
X-CRM114-Status: GOOD (  10.65  )
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

From: Martin Sebor
> Sent: 22 March 2021 22:08
...
> In GCC 11, all access warnings expect objects to be either declared
> or allocated.  Pointers with constant values are taken to point to
> nothing valid (as Arnd mentioned above, this is to detect invalid
> accesses to members of structs at address zero).
> 
> One possible solution to the known address problem is to extend GCC
> attributes address and io that pin an object to a hardwired address
> to all targets (at the moment they're supported on just one or two
> targets).  I'm not sure this can still happen before GCC 11 releases
> sometime in April or May.

A different solution is to define a normal C external data item
and then assign a fixed address with an asm statement or in
the linker script.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
