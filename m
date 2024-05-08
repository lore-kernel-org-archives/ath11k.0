Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32070C04FFE
	for <ath11k@archiver.kernel.org>; Wed,  8 May 2024 19:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Date:Message-ID:Mime-Version:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOYmvy0PkID50mXd+RQtaE9PWCnsGAIm508v4ifswfU=; b=Zruw5L5abZQr0I7xUu2H938csJ
	JYZrjPL+rYTSSRxCwpw1k1uf1I3Wni1Vl2EgrSNGqK4UL/YgKF1J8yw1REjBO1DNrFhZinnxsuKEy
	+8CECaTb1Y7A58Ob3M5HFYtTi2rrsRyar9oLzvG+L/Qm0U/sVHbF0bEfirYaeo4oglhfHnu7JmXtu
	XuSolscgenc/Of1zsF0mSebgZIc5cA1eqmtH0BZhETq2Cbd+YZfhXkj8wyiNMv71bKzkg04hxjDPs
	3w4yxtBVfALkJtUTXQPg55GaKqUwW+2Xp99ycfcaw2/HqBAm4f1h7C/ZPv3lhSo0x+6Xi+j60cA8n
	whSY/l0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4my2-0000000GkAG-3K3J;
	Wed, 08 May 2024 19:28:42 +0000
Received: from [137.220.190.183] (helo=mail0.jo282.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mxx-0000000Gk7L-2jvN
	for ath11k@lists.infradead.org;
	Wed, 08 May 2024 19:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=jo282.com;
 h=From:To:Subject:Mime-Version:Message-ID:Date:Content-Type:
 Content-Transfer-Encoding; i=no-reply@jo282.com;
 bh=lOYmvy0PkID50mXd+RQtaE9PWCnsGAIm508v4ifswfU=;
 b=BaHgaHCGCjeiL7EtZIafYByRp98wRDxGdtSYnHeU8rfx9Jl1CwO3RMCYEl876LN5KSnoZKR5i5aD
   xBxXavOOvBmVfS9uvXO+tHZMJ72FQt5wPxKxW6BRVaZNnKn5ONQdJ5lFBgisqbyecRaE/KTLb8qO
   RFZr7dYt74f4CsUCIA4=
From: =?utf-8?B?6Ieq5YuV44Oh44O844Or6YCB5L+h?= <no-reply@jo282.com>
To: =?utf-8?B?YXRoMTFr?= <ath11k@lists.infradead.org>
Subject: =?utf-8?B?44CQ5LiJ5LqV5L2P5Y+L44Kr44O844OJ44CR44GU5Yip55So?=
	=?utf-8?B?5YaF5a6544Gu44GK55+l44KJ44Gb?=
Mime-Version: 1.0
Message-ID: <tencent_9422192DB482B3347AD598B2@jo282.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
Date: Thu, 09 May 2024 03:28:20 +0800
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_122839_185933_DDCA1DCE 
X-CRM114-Status: UNSURE (   2.00  )
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

三井住友カードをご利用のお客様へ

このたびは三井住友カードをご利用いただき、誠にありがとうございます。
下記のご利用照会がございましたので、お知らせいたします。

※本メールは、ご利用・請求を確定するものではありません。
ご利用日時：2024/05/08      23:18
ご利用場所：セブン-イレブン 千代田一ツ橋 3 丁目店
ご利用金額：16, 580円

カードを使用した覚えがない場合は、以下 の リ ン ク をクリ ッ ク し てカ ー ド使用の詳細を確認してください。
https://zzxck120.com

＜ご注意点＞
本サービスは、お客様の三井住友カードのご利用照会が行われた場合、
三 井 住 友 NETにご登録いただいているメールアドレスへお知らせするサービスです。
——————————————————————
■発 行 者■
三井住友カード株式会社
〒135-0061
東京都江東区豊洲2丁目2番31


