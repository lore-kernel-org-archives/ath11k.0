Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5DD609BA
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2N93lXlkkWmnK3QygTnOg7BE1lU6KCWvJYDtF78mQU=; b=UQyKbmrOZBogC0YnS8nZI2Cvai
	CX81mznl9OWdN87sTrsxuYZFXW1hSNV2jmltfiu+KwvwGtOay1yYJgCGZYvh4SMqiyd5KFtjwocyr
	kvnD7g1SYrtr3I7jq5uZDe9w3Dr/96jW47oh+vPlr0wn5olP9lKdFLIm/ai003oZJ6sYdxgTAYGLN
	5w3oIuj/LT9nDW+bTQHnZpqc23vCUjEBATaIwpxH76tZOLEgDlJoLtT4kfck/1ySXaY1+GRo8gRxb
	9RT8C6cvvqY6dGPs+n+KtvJ/mWPwRXN80B5tML4jw/W6NAWdDfLMkZEY9xnNN/dnMmMG26fOzBphY
	8FTzeUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDzu-0000000Cf0d-3eJE;
	Wed, 27 Nov 2024 09:06:10 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDzr-0000000CezS-3Fw8
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 09:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732698365; x=1733303165; i=markus.elfring@web.de;
	bh=r2N93lXlkkWmnK3QygTnOg7BE1lU6KCWvJYDtF78mQU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=O3/1brLODTDDwNzbukpTD33n5fgI9xMf8dXNgVSljawzRpd4vk+DR4ULEHVEAnyc
	 1K56PtvWD1QmXziLcE2x/uawTINAYmmodzOCy8m639NrPXs3KIx+THcryL+FNt2aP
	 KgGHFzTekmd5wFJcfvWhgRIJA+oDv7D3NDCs3S2k/ygRdmUZOm1JR8l1W0y4HfhBK
	 0VoozSHNTtdgo7e60CRpTHiPU/x0Sxo+A34uPhbI+8dGudlm4oihMXUTYmwb15L+h
	 g3Etxnq084K8vddaeGwXSl8PnvlZxrllqV+BMyNg3HDIlHsJ93NC917UVy1KsfxvC
	 4C4YM42EmkC4IgU3lQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MT7aP-1t8A9j3mRz-00UQDP; Wed, 27
 Nov 2024 10:06:04 +0100
Message-ID: <a77fe99d-079b-4ef3-a1ce-6aea10256860@web.de>
Date: Wed, 27 Nov 2024 10:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4?] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
To: Baichuan Qi <zghbqbc@gmail.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Johnson <jjohnson@kernel.org>
References: <a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de>
 <20241127033241.60478-1-zghbqbc@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241127033241.60478-1-zghbqbc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZCgGeWswJhW4qQl74iKNQqJJsw3uVk6d6t2h0sBzF1JJbAf7EfF
 CKyNdwyRYFEtZBlR9tB30prKCqhEf0mppZXgepJHTirdA0k6IlnRltNUoueVyLQ/rovSqFv
 VGsg/rAob0P642Bel9DBGlS4t+c4n+eKY/GRIG7Gu+n5dZKb/aD62befocNMV5RB916abVJ
 6g0sAtU7b49OCMm5n8rDA==
UI-OutboundReport: notjunk:1;M01:P0:8RNY/ZCRYK4=;H+R6xGo8OAVw+2fkqDaS6mMHccv
 n7CfkWqidCE697R4smazxW3hprt/iCth6rNITrVuLhnfjBWbH8Tiq/My94oQnUxDaTnPg5H2n
 kPsc+d3D4QWZbSgAJju+pVxNMVaeCkLBwmh6LPl9/dED+9D90H8EpdP5XzlDTIGu7CbXW2pln
 Ly4Q1kkVY80lKJR897e6hivuQerNxg4K42CXFKqew428gP1H/R62ZYPujp9oqzjjhbmkKHVuL
 fjk+V9FhaZ/bjewWNeosSsKUaYYzSlYZ8dQfuZIF0dKMRBaryl6VSkCvT/q5mSQDdmn40f9ix
 0Mx1HEgA0H2a4EdK2z6+z6n80X7ahYr+1EbWZ74sISXb5D1BoNE/KaZqE4sRcLsMrGewOo85K
 H53ayriDILFhx82RtpkZRrhLVOlHI/qtGQS5w859GvDYXr72ODmt02ZpwDPDbOMFBB3fDo+mu
 PdO4xs3Gfq8mbkjGiu6HznqEP6IXcrEFHPWW00Q4yrjwO0wa+h9LFh4xHgKe2S2gt1ieOIe7c
 POBc2w2iPO20oZbPQGpwpJTx0wx2MSgNsjxXvVkaXYgIXaD4BC4uBEpx60NLDdJR2GyS0q40k
 o0s+FJtGm4MRS3AZcHA8QY67kLFQNMMtFPTB2e379Zc/JERHsGwJ/e6PRx2yoefJHv4cAA8+X
 p3r2pOdRy6/oQVg8NJEhfDAnaSo13rsYNbepQCsqrajqu4bqkEN+SAookz2MsFlCintg2qgRZ
 3UOt3GAXwPuyHgCzKfqO4JV9h5MdXHmSlF+pENS1EwFp9aCuQMcCbORYJiOOiQKnza+9vY7HO
 sAdrB26XKdCQJVl+CTc0wc+XbYpwgXnHD5T4UQ1upSnx8XBnizoXNU4y9h0SlJcKzdC7dsoUO
 prKh8ijN+At6SdmFZ5ToKPAZADxAtX3H5sDLdez0UhL4lPcOkLK9QQeYT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_010608_185684_8B589F70 
X-CRM114-Status: UNSURE (   4.12  )
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

> This patch fixes the NON-NULL check by =E2=80=A6

> ---
>  drivers/net/wireless/ath/ath11k/ce.c | 2 +-
=E2=80=A6

Did you overlook any guidance once more?

See also:
* https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+p=
reviously+submitted+patch%22

* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.12#n94


Regards,
Markus

