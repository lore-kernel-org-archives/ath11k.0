Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E148C25B75
	for <ath11k@archiver.kernel.org>; Fri, 31 May 2024 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eU8eFfoGajfOWI2fkL60Zp5gUtb5uEG6/IVEgG1y7EI=; b=H3Z8N17ZC6zs9Rm40VlGbd5nRk
	wgoTa3xb9WioyknSpESeUcrrHjvB1BUv/9iwn2lAtd4G5h0OLZjKaYnOicivfc8h0H/1UtFRRQPYS
	m3Andy+L40vIAL6k98cu98jEWfFI6PA65fNPIQXezLIeDLJCEqek5/xlLKRk0JhpdAq5RYNQ7WPFP
	dnyY+FXGaVGZdPW8pQ87ZGV+n9l7TulLuxEcDl9Y6Vq/9NM4EH3XWwd6GFiw4uvFwlX+bEg8U3C/k
	w3RORvkq7qVT9iqhzxcKCga9qRdDHOIPv/WcNMDX5WpY6NMkz1aNB8zh7kSkuNh3o54DhcNQUaZyD
	EhKI7tSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD40d-0000000AenB-1rGE;
	Fri, 31 May 2024 15:17:35 +0000
Received: from [137.220.228.112] (helo=mail0.odn648.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD40Y-0000000Ael1-1lBg
	for ath11k@lists.infradead.org;
	Fri, 31 May 2024 15:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=odn648.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=no-reply@odn648.com;
 bh=eU8eFfoGajfOWI2fkL60Zp5gUtb5uEG6/IVEgG1y7EI=;
 b=Z2b8Pw78xP6Gry++hcrWEnzlj53UBfbVvbg6rJB/nufFc8tSM9IxfsoNSTFJIqjFdrAaDN/Tuqoo
   y2yEfhE3+zFl6COI3K5iRLnY2n4gWzDv3AwIKDdArARFVD/9XHcyUxazYshy+9HB48QcNfVbKelt
   vvi3qk3OmxutTtIMsKQ=
From: =?utf-8?B?5LiJIOS6lSDkvY8g5Y+L?= <no-reply@odn648.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: =?utf-8?B?44CQIOS4ieS6leS9j+WPi+OCq+ODvOODiSDjgJE15pyI44GU?=
	=?utf-8?B?6KuL5rGC6aGN44Gu44GK55+l44KJ44Gb?=
Date: Fri, 31 May 2024 23:07:07 +0800
Message-ID: <NFJHIFMECBLLOOFIOBGLOGEJIJPN.no-reply@odn648.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-MSMail-Priority: Normal
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_081730_953393_B80136B0 
X-CRM114-Status: UNSURE (  -0.14  )
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

いつも三井住友カードをご利用いただき、ありがとうございます。
本メールはWeb明細(環境宣言)にご登録いただいているお客さまにお送りしております。

5月のご請求額が確定いたしました。
━━━━━━━━━━━━━━━━
お支払いについて
━━━━━━━━━━━━━━━━
ご利用カード ： 三井住友カード
お支払日 ：2024年6月2日

口座残高のご確認・ご入金は、お支払日の前営業日までにお願いいたします。

▼ご請求明細のご確認はこちら
https://zgsjhl.com

※メール作成時点での請求確定額になります。ご利用状況により再度請求額確定メールをお送りする場合がございます。
━━━━━━━━━━━━━━━━
発行：株式会社三井住友カード
〒135-0061 
東京都江東区豊洲2丁目2番31号 SMBC豊洲ビル
このメールに掲載された内容を許可なく転載することを禁じます。
━━━━━━━━━━━━━━━━


