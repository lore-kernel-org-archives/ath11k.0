Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902DBE95372
	for <ath11k@archiver.kernel.org>; Wed,  4 Feb 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MYBuTu5OB75A6/GrlgsR5Q1v5/fZBHf5I/RU1z8ZZiE=; b=ht745PzvkFonuF
	lBCYH4xJRrNeRTTKGzUYlV9zdtx2RV5bWiUudPa+V01n4P4BY3J9Pt/CUZOuDwAd4KwIzpBukQPvn
	yEf5OFH3j7T7zca8AlEPk6Oiw9UFeyN90wLSQwKKdFaxgwcB8JzV96biTbEFhzCUM3hlQTkJDXmdG
	4MaKkxknsmb3QKXH+4PTUvs+sgYiuIYornINzzsaRDRv8mr/5Q6O2YoQBVhnhRzWUJ5PvW5d0M+5L
	nj5HH/MJUfbXdTyHjNtvVuvdT7E9va6bGZ7ROSW3c/a2SnjEQsntjAILaJZK/W5cScsBhb62oieEy
	Wf6E7l0ZfosbIfTPn06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZtA-00000008Gyz-3Beo;
	Wed, 04 Feb 2026 10:13:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZt9-00000008Gyt-25ao
	for ath11k@bombadil.infradead.org;
	Wed, 04 Feb 2026 10:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MYBuTu5OB75A6/GrlgsR5Q1v5/fZBHf5I/RU1z8ZZiE=; b=jgxm+4jHxbmIopvjrXJPK1jS4h
	8l2SIudcBOZqQKV5Ie1Kf0lWdUKfwbkQdH2JGwpQdYYiQyzey9FcH3AGjBOesn87Qxr5LB+kDS83q
	wyCphKyYwdZKh17FySpk316rUu68onCAWFWJ4HWBnVWtcpIZab0ctJuR4JiKJFZ1Lz5XmquhYTA7K
	ChJM/m6LgG1FXl2UBXFE9VFTdUd8YlLdSTtBxH8nZ+1qa2p4LOZdOTYq8j/7voCeWWHRdoTNQnRo5
	6fja60GljP68xm+autpMRCxnZCUI/Vm6c2YlynvXIyu62LP3sCFZVRczb4Lt5yxncwylih1fFoWZ/
	VtsKfRxg==;
Received: from mail.central-kino-rottweil.de ([85.214.227.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZt6-00000000HwQ-1rLy
	for ath11k@lists.infradead.org;
	Wed, 04 Feb 2026 10:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=central-kino-rottweil.de;
	s=2020; t=1770192347; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=MYBuTu5OB75A6/GrlgsR5Q1v5/fZBHf5I/RU1z8ZZiE=;
	b=QkOo1Y7MwfXib/yq1kXw+qzLvk5MIcpMqc1iSiJ59bQ5FWQVQQzj2E18KjkZik7r9FONb7
	W8QFdVEwjeawQFNV/Iqz+BRV8Xt7ttbnkPtdMhi7gjOnpp57T52q8hYvuP2QJcSgMq3fSo
	IzoPfBNJsKGTSggAsxfcRlYhRwnK362gQgdMc9WebRq6bETGyY4bdHuuGTLnEOJeD3ysNY
	dL+WBC1UUh8fgxW582yr/mn3FljOMuP835bBlo1riKO9kPqiweem2uywoYdIMQuIE/7qvV
	aRcB0MCJJ4pLcrfbc4/9BKIPBfrvqPO6RMMalaYxmgQadSkZtbVfaiV8tKCTZw==
From: fsj@central-kino-rottweil.de
To: ath11k@lists.infradead.org
Subject: /KXM/
Date: 4 Feb 2026 00:05:46 -0800
Message-ID: <20260204000545.A7CF65A8B16BEFAE@central-kino-rottweil.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=fsj@central-kino-rottweil.de smtp.mailfrom=fsj@central-kino-rottweil.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_101332_628306_B8052985 
X-CRM114-Status: UNSURE (  -0.98  )
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
Reply-To: info.superenalotto@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



Wir freuen uns, Ihnen mitteilen zu k=C3=B6nnen, dass Sie zu den=20
Gewinnern der letzten SuperEnalotto-Ziehung in Zusammenarbeit mit=20
Lotto24 geh=C3=B6ren. EuroMillions und Powerball sind ebenfalls=20
enthalten. Sie haben einen einmaligen Gewinn von =E2=82=AC3.850.000  in=20
der zweiten Gewinnklasse erzielt. Um Ihren Gewinn zu bearbeiten,=20
senden Sie uns bitte die folgenden Informationen per E-Mail:

Vollst=C3=A4ndiger Name: Land: Adresse: Alter: Geschlecht: Beruf:=20
Mobilnummer: WhatsApp- und Telegram-Nummer.

Im Namen der Online-Lotterie-Abteilung SuperEnalotto gratulieren=20
wir Ihnen herzlich zu Ihrem wohlverdienten EuroMillions- und=20
Powerball-Gewinn!

