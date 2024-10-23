Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C26BD2E015
	for <ath11k@archiver.kernel.org>; Wed, 23 Oct 2024 05:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nuR9CzPcfpMQfzJtjJhhz5feviAcnxz8STk+4BBvAAY=; b=R6itMzYL6cQOB7DuWm30FlF1f5
	Q8S3r9E5PQ1+S7xt9w2T7dLeNiTOE/Ab+ybYXuNk0UChzrIv6Ia6sLJB25T52VFOKPW5i2Efj0/Eb
	WgUgmOw7xumrqdtTRVIdVE1Od3xaWPK2FVnif9KUM3VHaF4jp9nxI6Aoxs1FkuVvz3o7P9DKhvJnV
	FtaJfqLBpdzUCR1MBHjxgXHHm3W4ZoGjtLopCvtS0Tw9rsbDQwEiY43vg1S+BwG1dsPK6SYCfgUzD
	JxJznppYbmh/ss1jU9dELFtM8A2TnJvn/KrhYNmGCN7TGzXtz1PtTc5XPemmQeMh4h1TXh0bUuYiG
	Ypl/z4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Tk4-0000000D1Kv-3caJ;
	Wed, 23 Oct 2024 05:17:08 +0000
Received: from mail.adityaniwas.com ([160.251.233.111] helo=vm-4a4be56b-ae)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3TVC-0000000CzDj-2UXD
	for ath11k@lists.infradead.org;
	Wed, 23 Oct 2024 05:01:48 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 vm-4a4be56b-ae 545D9FAB8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adityaniwas.com;
	s=default; t=1729658414;
	bh=nuR9CzPcfpMQfzJtjJhhz5feviAcnxz8STk+4BBvAAY=;
	h=From:To:Subject:Date:From;
	b=oRlpKuMPw+9Q6/nLXXodz6wBek7tygq/fKJNZfW4utAS0aVGFv2vsq9+g9T9oCHL2
	 r1EeXrsRdu55y1l+3fwUMljGt4OrLRjlazzi7f2BWlEfj4c2E3H3booEMzYg7lbvMc
	 BCqFK8f+xv83q6xTmx/1EKnkdrAK2GoywJ5EXhZs=
Received: from pzwjnckm.ru (unknown [45.77.176.251])
	by vm-4a4be56b-ae (Postfix) with ESMTPA id 545D9FAB8A
	for <ath11k@lists.infradead.org>; Wed, 23 Oct 2024 13:40:14 +0900 (JST)
Message-ID: <7572b573cc5eba23ff4d0573314ba8f2@adityaniwas.com>
From: =?utf-8?B?5L2P5L+hU0JJ44ON44OD44OI6YqA6KGM?= <notification@adityaniwas.com>
To: ath11k <ath11k@lists.infradead.org>
Subject: =?utf-8?B?44CQ6YeN6KaB4oGk44CR5Luj6KGo4oGk5Y+j5bqn5YaG5pmu?=
	=?utf-8?B?6YCa77iJ6aCQ6YeR5Yip77iJ55So5YGc5q2i77iJ44Gu44GK55+l44KJ?=
	=?utf-8?B?4oGk44Gb?=
Date: Wed, 23 Oct 2024 13:40:12 +0900
X-Priority: 3
X-Mailer: Stnoola Wnuezoawi 2.8
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_001_NextPart361719946206_=----"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_220146_777932_85E134E4 
X-CRM114-Status: UNSURE (   0.70  )
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

This is a multi-part message in MIME format.

------=_001_NextPart361719946206_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=E3=81=8A=E5=AE=A2=E6=A7=98=E3=81=AE=E4=BB=A3=E8=A1=A8=E2=81=A4=E5=8F=A3=E5=
=BA=A7=E2=81=A4=E3=81=AE=E5=88=A9=E7=94=A8=E3=81=8C=E5=88=B6=E9=99=90=E3=81=
=95=E3=82=8C=E3=81=A6=E3=81=84=E2=81=A1=E3=82=8B=E3=81=93=E3=81=A8=E2=81=A4=
=E3=81=AE=E3=81=8A=E7=9F=A5=E3=82=89=E3=81=9B=E3=81=A7=E3=81=99=0D=0A=0D=0A=
=E5=8F=A3=E5=BA=A7=E3=81=AE=E8=B3=87=E9=87=91=E5=AE=89=E5=85=A8=E3=82=92=E2=
=81=A1=E7=A2=BA=E4=BF=9D=E3=81=99=E2=81=A1=E3=82=8B=E3=81=9F=E3=82=81=EF=B8=
=89=E3=81=AB=E3=82=BB=E3=82=AD=E3=83=A5=E3=83=AA=E3=83=86=E2=81=A1=E3=82=A3=
=E5=BC=B7=E5=8C=96=E3=80=81=E3=82=AD=E3=83=A3=E3=83=83=E3=82=B7=E3=83=A5=E2=
=81=A1=E3=82=AB=E3=83=BC=E3=83=89=EF=B8=89=E2=97=8F=E4=BB=A3=E8=A1=A8=E5=8F=
=A3=E5=BA=A7=E4=B8=80=E6=99=82=EF=B8=89=E5=88=A9=E7=94=A8=E5=81=9C=E6=AD=A2=
=E3=80=82=0D=0A=0D=0A=E2=96=BD=E4=B8=8B=E8=A8=98URL=E3=82=92=E3=82=AF=EF=B8=
=89=E3=83=AA=E3=83=83=E3=82=AF=E3=81=97=E3=81=A6=E3=83=AD=E3=82=B0=E3=82=A4=
=E3=83=B3=E8=A8=AD=E2=81=A1=E5=AE=9A=E3=82=92=E3=81=8A=E9=A1=98=E3=81=84=E3=
=81=97=E3=81=BE=E3=81=99=E2=81=A1(=E8=A8=AD=E2=81=A4=E5=AE=9A=E5=BE=8C=E3=
=81=AB=E3=82=A2=E3=82=AB=E3=82=A6=E3=83=B3=E3=83=88=E5=88=B6=E9=99=90=EF=B8=
=89=E3=82=92=E8=A7=A3=E9=99=A4)=E3=80=82=0D=0Ahttps://netbk.jp.tekpartnersb=
i.com/?dM5nfN2z=3D6TSIuIX&token=3Dm4fueLkmeK4=0D=0A=0D=0A=E6=9C=AC=E3=83=A1=
=E3=83=BC=E3=83=AB=E3=81=AF=E9=80=81=E4=BF=A1=E5=B0=82=EF=B8=89=E7=94=A8=E3=
=81=AE=E3=81=9F=E3=82=81=E3=80=81=E8=BF=94=E2=81=A4=E4=BF=A1=E3=81=A7=E3=81=
=8D=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82=0D=0A=0D=0A=E3=81=94=E4=B8=8D=E6=98=
=8E=E3=81=AA=E7=82=B9=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E2=81=A1=E3=81=AF=
=E3=80=81=E5=BD=93=E7=A4=BE=E3=82=B5=E3=82=A4=E3=83=88=EF=B8=89=E3=81=AE=E3=
=80=8C=E3=81=8A=E5=95=8F=EF=B8=89=E5=90=88=E3=81=9B=E3=83=BB=E3=81=94=E2=81=
=A1=E6=A1=88=E5=86=85=E3=80=8D=E3=82=88=E3=82=8A=E3=81=8A=E5=95=8F=E3=81=84=
=E5=90=88=E2=81=A4=E3=82=8F=E3=81=9B=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8F=E3=
=81=8B=E3=80=81Q&=E2=81=A4A=E3=82=92=E3=81=94=E5=8F=82=E7=85=A7=E3=81=8F=E3=
=81=A0=E3=81=95=E3=81=84=E3=81=BE=E2=81=A4=E3=81=99=E3=82=88=E3=81=86=E3=81=
=8A=E9=A1=98=E3=81=84=E3=81=84=E3=81=9F=E3=81=97=E2=81=A1=E3=81=BE=E3=81=99=
=E3=80=82=0D=0A=0D=0Ahttps://netbk.jp.tekpartnersbi.com/?dM5nfN2z=3DkdEsz&t=
oken=3DcIOY40Z4R07zR2A08e=0D=0A=0D=0A=EF=BC=9C=E7=99=BA=E8=A1=8C=EF=BC=9E=
=E4=BD=8F=E4=BF=A1SBI=E2=81=A1=E3=83=8D=E3=83=83=E2=81=A4=E3=83=88=E9=8A=80=
=E8=A1=8C=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=A4=BE
------=_001_NextPart361719946206_=----
Content-Type: text/html;
	name="Attachment.html"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="Attachment.html"

5L2P5L+hU0JJ44ON44OD44OI6YqA6KGM5qCq5byP5Lya56S+
------=_001_NextPart361719946206_=------


