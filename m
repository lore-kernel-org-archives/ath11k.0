Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E08C4167B
	for <ath11k@archiver.kernel.org>; Sat,  9 Dec 2023 02:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZVtgXJkz+SHkqINfMrdE80iUPT3tAA/d4LLHLnFXIto=; b=Zx1Mc8Qfz0yllS
	6pElIWWXtU3bUTk33iAd7DbGYbWtQ9kwegTZzKVCJLIMkEopJPnDqFpb4v3SUIuiBM+/6e2eFdcDF
	ALPJj3XUsxpnziTe0kPSG9EiYcd6xB5qpr3Tkjfbdt+Dzkwj1rCSoojIJ6MNyCo2lngMhlqqt3TsK
	Prknk9Hb/oWW/rQLa8bQ4acqXogBobVV0m/C1xik+Xba20824LJvVp9mtBIf/d7+48MPI++gY+otk
	wn8w22LzEbbdNpe/8HEA20Dtlx/HqTsk6hMvC8Pbje967Eal6jDr/bBQGEcSgoOg8H4uYD+gTAtnp
	vajf8J5+eOxS8QV9mR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBn0c-00Gxb4-38;
	Sat, 09 Dec 2023 02:24:02 +0000
Received: from mbox.chem.uni-sofia.bg ([2001:67c:20d0:50::7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBn0Z-00GxaL-1X
	for ath11k@lists.infradead.org;
	Sat, 09 Dec 2023 02:24:01 +0000
X-Authost: /var/run/dovecot/lmtp
DKIM-Filter: OpenDKIM Filter v2.11.0 mbox.chem.uni-sofia.bg 3B6CtcBr007454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chem.uni-sofia.bg;
	s=2018101300; t=1701867371;
	bh=ZVtgXJkz+SHkqINfMrdE80iUPT3tAA/d4LLHLnFXIto=;
	h=Reply-To:From:To:Subject:Date:From;
	b=GL/u4vttrFhWrspmiFPQVE8462JCukBLhYIGEl0a+nLag2pXXwdgXsFb2zb0qs+dj
	 ra4jwSGPaaO/9yLy3gIQS8f26OtPgvbtJ3Wxk6TCJZWeFEynwuJ/YTzpN9iG2JoIZP
	 py6ujNGz2ufOoOyAuV8PzP0LH3iuYPtSjhSHzCIQTr8/Jdj9nIVMWEZH7w6+6hTDwc
	 zrb5ks2niPlGqtMLzQbC9Ra6uKLur3oLcxVyC9jVTaQ8VBa62rEINhAfeKv5dCaIzR
	 uwG7FK9uXQJttzgcd6A3cWpJFf7LOjA7+ybx+9NCC1zXlPQlpQPm2CS9BfkFYsWQQo
	 bXtyRGJ3iJVQQ==
Received: from chem.uni-sofia.bg ([216.24.213.33])
	(authenticated bits=0)
	by mbox.chem.uni-sofia.bg (8.14.7/8.14.7) with ESMTP id 3B6CtcBr007454
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <ath11k@lists.infradead.org>; Wed, 6 Dec 2023 14:56:10 +0200
From: "Kristine Wellenstein" <ohtvd@chem.uni-sofia.bg>
To: ath11k@lists.infradead.org
Subject: [RE]: RE:
Date: 06 Dec 2023 07:56:09 -0500
Message-ID: <20231206075609.DAA06EC38F01437D@chem.uni-sofia.bg>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_182400_282273_CEE04BA2 
X-CRM114-Status: UNSURE (   0.06  )
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
Reply-To: Kristine Wellenstein <brianwallace927@gmail.com>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Gr=C3=BC=C3=9Fe,

Mein Name ist Kristine Wellenstein. Ich schreibe Ihnen, um Ihnen eine spann=
ende Gesch=C3=A4ftsm=C3=B6glichkeit vorzustellen, von der ich glaube, dass =
sie f=C3=BCr uns beide von Vorteil sein k=C3=B6nnte.

Ich arbeite in einem bekannten Pharmaunternehmen in Asien und wir haben k=
=C3=BCrzlich ein neues Produkt/eine neue Dienstleistung entwickelt, die neu=
e M=C3=B6glichkeiten er=C3=B6ffnet.

Ich w=C3=BCrde gerne eine Gesch=C3=A4ftsvereinbarung vorschlagen, um diese =
M=C3=B6glichkeit detaillierter zu besprechen. Ich bin zuversichtlich, dass =
diese Gelegenheit f=C3=BCr uns beide von Vorteil w=C3=A4re, wenn wir gut mi=
teinander auskommen.

Ich freue mich auf die Gelegenheit, mit Ihnen zusammenzuarbeiten.

P.S. Sollten Sie nach unserem Gespr=C3=A4ch kein Interesse an diesem Angebo=
t haben, steht Ihnen ein Widerruf frei.

Ich erwarte eine positive Reaktion.

Gr=C3=BC=C3=9Fe

Kristine Wellenstein

