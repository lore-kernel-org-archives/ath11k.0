Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676D1C531D0
	for <ath11k@archiver.kernel.org>; Tue, 28 Jul 2026 01:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:References:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=QhLN/OHWsz0ANNAJGBwScJ9jDSugbm6tMuY1akxUza0=; b=UacioKHhuq86IOtjNWHb0nU9HF
	RbciYEmZxsshqm2/88ngIpaznCMy6AKvuOxf8wqhzndOnOvQZ5ylIxDL0YAhJXtUQ7QgawLDf2P8w
	4n3KIrCcOmUnD/qvqZmnuO0mQHu507TboqooTj1BdiGoyQxID0Si/EjXM8YmjTuM8jHlHOOXqootY
	tVLP89nQ61k0FsSE7B1d2+99KhpkrymFa2HWsCBg4kx+J7CN1NPMyWqlckXvJIlaF+Lvv7QWFOrLQ
	jvpDsB88jYCeKlMB5QCn1+s5K86IDx8XwfZhI6N1dtLSrgUntVFl6WD4ATbaxvFs7DlyjZvUVyQ9N
	6Sux6IaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWt5-00000004DVS-2ImU;
	Tue, 28 Jul 2026 01:45:43 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWsz-00000004DTU-0rrT
	for ath11k@lists.infradead.org;
	Tue, 28 Jul 2026 01:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785203111;
	bh=QhLN/OHWsz0ANNAJGBwScJ9jDSugbm6tMuY1akxUza0=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=f9v4+riyg/9w3/G2HBNhwVTwwLWkJW+gQTf+Ppa4W/51SQt0HhJnidk+zH/K451iz
	 2ONylMe++BAYFbJdMf20UpFz80VMbTnabNvoe+6vk73yyFMx0GofaxxeVbwabbmGR8
	 lG2Te03D4n7tsh4iZniPBtMZ2ZQ7G1FVJS6/n2Q4=
X-QQ-mid: esmtpsz19t1785203104t7b734666
X-QQ-Originating-IP: 6DR+UVQFjbxV/NRs5a6OdyIEQs3ahXlslo2PHL15DxY=
Received: from PEN002676 ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 09:45:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3024313782643152738
Date: Tue, 28 Jul 2026 09:45:02 +0800
From: =?GB2312?B?1dS98MP3?= <zhaojinming@uniontech.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, 
	baochen.qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath11k <ath11k@lists.infradead.org>, 
	jjohnson <jjohnson@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6] wifi: ath11k: fix resource leak on error in ext IRQ setup
References: <b6903572-52cc-4c41-b9cf-5845e387c176@oss.qualcomm.com>, 
	<20260727065500.3827035-1-zhaojinming@uniontech.com>, 
	<81a72170-870a-47be-930d-0772b7934ab2@oss.qualcomm.com>
X-Priority: 3
X-GUID: 6E432D6D-07EF-4BE0-AE05-CD7A2A3DC886
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.375[cn]
Mime-Version: 1.0
Message-ID: <A77EF7332E024D0E+202607280945015602200@uniontech.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MjA5tsjrlPcv4HKdR6ssGaBVI1GdQcdX/o5vTOTn/GF+BWh1a65Pe+MM
	iVsmhMrQMHilqTjI7TI52ihuLOT0ka1h7aLBaf9+S02D0SDbSTvWpLRUEhcpNfu3E44ZmKP
	zIYTbP+FhpCqeUd6EG1n0dhP8ggLtCC/mD7Xzr/KAltnYrS8c0jbjZQVlp4VuNwAOcAZh5O
	yqFO1RbjaHnER/kvtwCDquhO0CDvQWM4HhjPWGxdM9ZJHrc9WNpQAq6R0hfrKuoScU19Dgu
	tArg410wZjSIp/+bsX2fGFATQII3Pvj0NHCHtTZ2N2wZ+g5Luv6lSZZCrb0p+MyoQYLM5sU
	iqkEy8uJWhK46xfD/u8ktxaGralGQKVeFvVDbvN2MUCXGRE72gaELebEvAFD4UxZ0OBkXuQ
	UMDzdTQ0bW0AvWsIKdxqaKs2lSJA5UuUE6CmF2s7/wYdN2v8GMONwpdfvVh097BUDg1yQWH
	j4S0qtt4JdnbDh0Yh7f4Z9sNNNQADTFJPT8dHePwfZy2fN6B8Qb0AbbkayDU+6KIvUz405v
	X3HCAvZ5fhMFZBDMhVrwK/P9+xSK2SN9spBf654aw0SeJ2jO+/P3wyoL/LsaLubtDo6G1g7
	BjROTVfK0TJrnA5AtIHwQmMPBvpvO7v5REetxD15LtRL2eTFc7IEtg01ebVSbYaBZpAuVb7
	TLgLXlim3/T6qKqv5LMSBYEw4KAe3GlZD4qiDZl32b3eDgnAI0wMCoNNO7r2Sp4B2OpoQKj
	rCLMY4a8OtyesYKEVypD1VQkjL/+F6DbcgIAL3DUdUEB9shxM5l+x0Y9yPTiWWaW8zRThsZ
	Q11UTHGk4ps8rOhHANiW73wyHlH4XvJJOoafBKXlouHbAV8RhdXbschhQpR1r414nsCTmIA
	ebYtwBrmg8gv2KZ/bsMm6LBD2qGdQFzPx6H2k89PtryDAHkFtuaxRsJfX/gt1NaElYszHB/
	YOsD07XsNtjOnGl69RNiVLbUC69T3GoH/EJO9n4xyZhHvmw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_184537_740908_3926AC14 
X-CRM114-Status: UNSURE (   8.05  )
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

SGkgSmVmZiwKClRoYW5rIHlvdSBmb3IgdGhlIHJlbWluZGVyLCBhbmQgSSBhcG9sb2dpemUgZm9y
IHRoZSBjb250aW51ZWQgbWlzc3RlcC4KCkkgZG8gcmVtZW1iZXIgeW91ciBwcmV2aW91cyBpbnN0
cnVjdGlvbiBhYm91dCBzdGFydGluZyBuZXcgcGF0Y2ggc2VyaWVzIGFzIHNlcGFyYXRlIHRocmVh
ZHMuIFRoZSByZWFzb24gSSBzZW50IHRoaXMgdjYgYXMgYSB0aHJlYWRlZCByZXBseSB0aGlzIHRp
bWUgd2FzIHRvIGtlZXAgdGhlIHJldmlldyBjb250ZXh0IGVhc2lseSBhY2Nlc3NpYmxlIGluIG15
IG1haWwgY2xpZW50IKGqIEkgZmluZCBpdCBoZWxwZnVsIHRvIGhhdmUgdGhlIGZlZWRiYWNrIGFu
ZCB0aGUgbmV3IHZlcnNpb24gZ3JvdXBlZCB0b2dldGhlciBmb3Igc2lkZT9ieT9zaWRlIHJlZmVy
ZW5jZSBkdXJpbmcgdGhlIHJldmlldyBwcm9jZXNzLgoKVGhhdCBzYWlkLCBJIGZ1bGx5IHVuZGVy
c3RhbmQgdGhhdCB0aGlzIGNvbnZlbmllbmNlIGZvciBteXNlbGYgY3JlYXRlcyBpbmNvbnZlbmll
bmNlIGZvciBvdGhlcnMsIGVzcGVjaWFsbHkgZm9yIHRob3NlIHdobyB1c2UgdGhyZWFkZWQgdmll
d3MgdG8gdHJhY2sgcGF0Y2ggZmxvdy4gTXkgaW50ZW50IHdhcyB0byBzZW5kIHRoZSBmaW5hbCwg
cmVhZHk/dG8/bWVyZ2UgdmVyc2lvbiBhcyBhIG5ldyB0aHJlYWQgb25jZSB0aGUgcmV2aWV3IG9u
IHRoaXMgcm91bmQgaGFkIHNldHRsZWQgoaogYnV0IEkgc2hvdWxkIGhhdmUgZm9sbG93ZWQgdGhl
IGVzdGFibGlzaGVkIHByb2Nlc3MgZnJvbSB0aGUgc3RhcnQuCgpUbyBjb3JyZWN0IHRoaXMsIEkg
d2lsbCBzZW5kIHY3IGFzIGEgY29tcGxldGVseSBuZXcgdGhyZWFkLCB3aXRoIHRoZSBsaW5rIHRv
IHRoaXMgZGlzY3Vzc2lvbiBhZGRlZCBhdCB0aGUgZW5kIG9mIHRoZSBjb21taXQgbWVzc2FnZSBm
b3IgdHJhY2VhYmlsaXR5LgoKQWdhaW4sIHNvcnJ5IGZvciB0aGUgbm9pc2UsIGFuZCB0aGFua3Mg
Zm9yIHlvdXIgcGF0aWVuY2UuCgpCZXN0IHJlZ2FyZHMsClpoYW8gSmlubWluZwoKCgo+QWZ0ZXIg
djQgSSByZW1pbmRlZCB5b3U6CgoKCj4+SW4gdGhlIGZ1dHVyZSBwbGVhc2UgcG9zdCBuZXcgdmVy
c2lvbnMgb2YgcGF0Y2hlcyBhcyBhIHNlcGFyYXRlIHRocmVhZC4KCgoKPgoKCgo+WWV0IG9uY2Ug
YWdhaW4geW91IHNlbnQgYSBuZXcgcGF0Y2ggYXMgYSB0aHJlYWRlZCByZXBseSBpbnN0ZWFkIG9m
IGFzIGEgbmV3CgoKCj50aHJlYWQuCgoKCj4KCgoKPjooCgoKCj4KCgoKPllvdSBhcmUgcnVpbmlu
ZyB5b3VyIHJlcHV0YXRpb24uCgoKCj4KCgoKPi9qZWZmCgoKCj4KCgo=


