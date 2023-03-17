Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B8BC6FD1D
	for <ath11k@archiver.kernel.org>; Fri, 17 Mar 2023 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lg+A4aUJhe3smtrcBVmT46cRPI/avlYq0e2U4+LaIbA=; b=IGxKgxPsRATKFr
	kCMAW/bsfs10V/aHUg+aQJ5GPqTmlqsGe6uImpcLRUKhOEMyEIfrDuu+2zPHQfzBFUFjUp5wOVQm2
	p8UPPvFrO1w2SJRQbxgeRyzNVpKNnNuROa6Bw12egUF0GDE1xc5hsj5+KKwuo1yuYP3CqajrmQ+n9
	8DgbkQCj0W5chCdzGK/l4/WQngK7Y0IGS2sT+6u3L28zGoC3L4z4ImamQHyabwfjClzktMUUt69wd
	iAfruCOokgkcJcKT4ffS5UeEIn5zGnbWVkUvyIknoZIewAlvGdfQB2UbqxFh+4YXcMutdIGlFDKYn
	EdpbFQSwZU8KQtON28MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5eV-001XAf-0l;
	Fri, 17 Mar 2023 08:41:31 +0000
Received: from mail.minllyn.pl ([80.211.129.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5eS-001X9W-2H
	for ath11k@lists.infradead.org;
	Fri, 17 Mar 2023 08:41:29 +0000
Received: by mail.minllyn.pl (Postfix, from userid 1002)
	id 241DE83612; Fri, 17 Mar 2023 09:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=minllyn.pl; s=mail;
	t=1679042485; bh=26cHeqbcn1IuuWX7a94P//w9QTZ9htcHwmBZg3/CEjM=;
	h=Date:From:To:Subject:From;
	b=oxAva/ZytKztGSm5/MiRkbDIAVzl7Tw4APNbGwcH0ts2GPQ495TPNG/98lToTj9zl
	 zwVKEbVknPYP3bq1THKWnM6zIe/y9J/kF0cXIb/7hk1+Qa54VFBMv0pC5vceEHDNgT
	 d16HhgQcidBTXogLBehGl6dKrrnfGXRFcT9ysh92aN3tTnxjWXQoGXYlRqmF7fxEO5
	 90Snqg8+g8zSusDIfd1ns21DKnHkzjsLYBnIGn3PO1fESNQ/N5BU5rrqa9TA7e2oyD
	 NjeekshH4ta5ityQhBunUGVV1wfS5NOSJ3QS6LXE1iiaMy6MmjHDd6m8pPC3QNFzT0
	 VuJ0Prj0h/M1g==
Received: by mail.minllyn.pl for <ath11k@lists.infradead.org>; Fri, 17 Mar 2023 08:40:57 GMT
Message-ID: <20230317084500-0.1.d.10xv.0.f8aa5l5vcc@minllyn.pl>
Date: Fri, 17 Mar 2023 08:40:57 GMT
From: "Robert Palacz" <robert.palacz@minllyn.pl>
To: <ath11k@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.minllyn.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_014128_939779_983CBBFE 
X-CRM114-Status: UNSURE (   1.04  )
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

RHppZcWEIGRvYnJ5LAoKcm96d2HFvGFsaSBQYcWEc3R3byB3eWLDs3IgZmluYW5zb3dhbmlhLCBr
dMOzcmUgc3BlxYJuaSBwb3RyemVieSBmaXJteSwgemFwZXduaWFqxIVjIG5hdHljaG1pYXN0b3d5
IGRvc3TEmXAgZG8gZ290w7N3a2ksIGJleiB6YsSZZG55Y2ggcHJ6ZXN0b2rDs3c/IAoKUHJ6eWdv
dG93YWxpxZtteSByb3p3acSFemFuaWEgZmFrdG9yaW5nb3dlIGRvcGFzb3dhbmUgZG8gUGHFhHN0
d2EgYnJhbsW8eSBpIHdpZWxrb8WbY2kgZmlybXksIGR6acSZa2kga3TDs3J5bSwgbmllIG11c3rE
hSBQYcWEc3R3byBtYXJ0d2nEhyBzacSZIG8gbmlld3lwxYJhY2Fsbm/Fm8SHIGtvbnRyYWhlbnTD
s3csIHBvbmlld2HFvCB0cmFuc2FrY2plIHPEhSB6YWJlenBpZWN6b25lIGkgcG9zaWFkYWrEhSBn
d2FyYW5jasSZIHNwxYJhdHkuIApDaGPEhSBQYcWEc3R3byBwcnplYW5hbGl6b3dhxIcgZG9zdMSZ
cG5lIG9wY2plPwoKClBvemRyYXdpYW0KUm9iZXJ0IFBhbGFjegoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
