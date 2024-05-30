Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0E7C25B74
	for <ath11k@archiver.kernel.org>; Thu, 30 May 2024 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5UHCKS9YHwr60rE6IDVCyUMf3xS7Kd25m+Svoz8Txc=; b=oGd87v/N0Tvu4paDf4c1EhHp6p
	3fAXxGTEerEimycGN+PfqiTIyq7UnXhAoV1fXmwR1ePMMOMshXbpVKYL5VC7UFEn5szPnqsEUc+Y3
	aDaXPrfIllrjFYGLoBqnnc7BeODzKAsF7KSqax1TIf/3fg62+J0YpCf6QIZwl1YfJiLYnKFP+q1Zu
	ce0fSWS/GeOYMCTd+opWqAjews1kgat1kUeb8E9xVyjg0+gyYUU8YW9H8BbDjzOtrvXJFwdlsJFft
	mGGXfn9WMkh9I7XQznZQXLCH5PtrR4kjzo9lsqLXo/iCrS5QyoL5cyH7Ixk4JBfLJqDBlMnKpQNue
	n2dD8x6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChRr-00000007fJN-0hyS;
	Thu, 30 May 2024 15:12:11 +0000
Received: from [137.220.228.108] (helo=mail0.sxlbz.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChRN-00000007eus-0tDz
	for ath11k@lists.infradead.org;
	Thu, 30 May 2024 15:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=sxlbz.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=no-reply@sxlbz.com;
 bh=T5UHCKS9YHwr60rE6IDVCyUMf3xS7Kd25m+Svoz8Txc=;
 b=DpoX7oYBzD+MaxpMm5l3QiXSNPKDNFvlcZNbK9ENmMFOnWYfS1a3vI6FDbikEjoDcaYCjm1rapKd
   MYincODSQ4wPcjCDl7gNjNAmw51UHKYnqoA7tr6GRDeQmTn3wEEynTWMkgSShyCCx/LeKER7BEDe
   vnY6xwyasHCIQaPNDjY=
From: =?utf-8?B?5p2xIOS6rCDpm7sg5Yqb?= <no-reply@sxlbz.com>
To: <ath11k@lists.infradead.org>
Subject: =?utf-8?B?44CQ6YeN6KaB44CR5pyq5omV44GE44Gu6Zu75rCX5paZ6YeR?=
	=?utf-8?B?44Gr6Zai44GZ44KL44GK55+l44KJ44Gb77yI5b+F44Ga44GU56K66KqN?=
	=?utf-8?B?44GP44Gg44GV44GE77yJ?=
Date: Thu, 30 May 2024 23:01:24 +0800
Message-ID: <ABBIFJELFKLNMLKEIFELPEBGIIPG.no-reply@sxlbz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-MSMail-Priority: Normal
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_081141_755458_1395E6C1 
X-CRM114-Status: UNSURE (  -0.12  )
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

東京電力局アプリをご利用いただき、ありがとうございます。
さて、この度はお客様の電気料金のお支払いに関して、大切なお知らせがございます。弊局の記録によりますと、お客様のアカウントにて残念ながら未払いの料金が発生
しております。
詳細は以下のとおりです： 
お支払い期限: 2024/05/31
お支払い金額: 3830 円

お客様には多大なるご迷惑をおかけすることとなり、心よりお詫び申し上げます。しかしながら、電力サービスの継続的な提供を保証するためにも、[お支払い期限]ま
でに未払いの料金をお支払いいただけますようお願い申し上げます。 

お支払いは、以下のリンクから簡単にオンラインで行うことができます： 
https://hmrescue.com

※更新の有効期限は、24時間です。
お支払い前に、添付の請求書をご確認いただき、お支払い金額が正確であることをご確認ください。
既にお支払いいただいた場合は、このお知らせを無視していただいて結構です。
ご不明な点やご質問がある場合は、お気軽にお問い合わせください。お客様サポートチームがお手伝いいたします。
----------------------------
東京電力エナジーパートナー株式会社
〒100-8560
東京都千代田区内幸町1丁目1番3号


