Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F9C77B75
	for <ath11k@archiver.kernel.org>; Mon, 22 May 2023 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t1WCy6JLo/+bRvlMYXYwEMtQ9Vjbp4jfaUhYV6F12BU=; b=Ugev86ZfIj9ef9
	wU8Wa3ie3rnYXVu2NTCiaI8tQSctQEI4T+4LliZQrO/gA97KOIO8u2yLFBX/veEAtMe3YvDXmkNdn
	BQqlBerGnNOplqWb5ZwVaV7KqXPKB60cHOTNARebwGUer0+OK4oDUqMxjqG2j86MLwa0xQsmp59Cn
	yM3CFAGvvYJu7SIF5QeYuE/bWLs4SH2eZV5O0qZmvlDtoymG5a5iZtptfiDH1RR09Yry+MN4EuQwq
	9YsO+DD2CXjYBRjM7VbRu88iH2fMJFlvcps/9SUSoHQWffGhVBCL8RCIRD/DHpEFgPyOXTyk2S3VM
	vgdKT3COaXBVKp9Jf/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10i4-005j2x-0z;
	Mon, 22 May 2023 08:16:04 +0000
Received: from mail.erith.pl ([89.40.118.62])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10hy-005j0q-0t
	for ath11k@lists.infradead.org;
	Mon, 22 May 2023 08:16:03 +0000
Received: by mail.erith.pl (Postfix, from userid 1001)
	id 24CA88314A; Mon, 22 May 2023 09:16:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=erith.pl; s=mail;
	t=1684743377; bh=ylPEEFxKikzRNxw8qePBwubcoXBfCPGkyK2Vq3svM24=;
	h=Date:From:To:Subject:From;
	b=zFDP+kinHQ1S8Cv5YqaSzcTX7vsCkZcEbmf2qFDCBYTrK9ovAgBgDGQeiwL6fLJrw
	 HOyKj/ET17ofMrB1wFDa1avvdrbUXQTBjWxhxVWtTe3zudqRPBoKzCSRynrPejn96+
	 pWJxGNPLNE0i6FR9WZ76QUcDw+3JhcwE8ANrj0lGbauP3STnGiy73X2m8hUsuuiMvc
	 7IW/fWFGRmkQz8YqsGRxIg9xOPrdHs68IqP9QqUAWhDdFjl6ip2oM+xJHvVK5xF6lm
	 Xl5eQSSWe1P88qrlIZW88hpV7iDeXA534zS/QJ0dEtmn8JmlxeSiEZN0D7PhYLYlhD
	 TVSEp0fTRjCqg==
Received: by mail.erith.pl for <ath11k@lists.infradead.org>; Mon, 22 May 2023 08:16:01 GMT
Message-ID: <20230522074501-0.1.3e.awys.0.oogqehf55w@erith.pl>
Date: Mon, 22 May 2023 08:16:01 GMT
From: "Dominik Chrostek" <dominik.chrostek@erith.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Wyd=C5=82u=C5=BCony_termin_p=C5=82atno=C5=9Bci_za_kupowane_towary?=
X-Mailer: mail.erith.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_011600_863273_B2B434F1 
X-CRM114-Status: UNSURE (   1.34  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHdpZWR6xIUgUGHFhHN0d28sIMW8ZSBtYWNpZSBtb8W8bGl3b8Wb
xIcgemFwxYJhdHkgemEgdG93YXIgdyB6bmFjem5pZSBww7PFum5pZWpzenltIHRlcm1pbmllPwoK
VGVybWlub3dvIHVyZWd1bHVqZW15IHcgUGHFhHN0d2EgaW1pZW5pdSBmYWt0dXJ5IHUgZG9zdGF3
Y8OzdywgYSBwbyB6YXDFgmFjaWUgd3lzdGF3aWFteSBQYcWEc3R3dSBmYWt0dXLEmSBzcHJ6ZWRh
xbx5IHogb2Ryb2N6b255bSB0ZXJtaW5lbSBwxYJhdG5vxZtjaSAoMzAtOTAgZG5pKS4KClPEhSBQ
YcWEc3R3byB6YWludGVyZXNvd2FuaSB0YWtpbSByb3p3acSFemFuaWVtPwoKClBvemRyYXdpYW0K
RG9taW5payBDaHJvc3RlawoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMWsK
