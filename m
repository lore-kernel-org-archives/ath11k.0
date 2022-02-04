Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13659C433EF
	for <ath11k@archiver.kernel.org>; Fri,  4 Feb 2022 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvMUIJCpjj3aB3i2nYvbkuEhpaOC4VI8pqZym3DdU6w=; b=hyqKbIyzHR8wjH
	tIw6ARtRKo9JNvMhA7/2qNsDKn2ACaooRIjGH89PBY4T1rajsyf90EIfylOMnwsTqHumHsqUptspW
	73R+xbPJ+RjEt7sJUXwR8R8YRaO5EsqAkIatMcXZpkugcl8FooADr9xMkyyvw+nN8AMZ+TBavUxCV
	nVO7iuHf072fY7XZNJWheRhguVqmHmq2yDVjtR3IRJyOSqzV4y3cGk9mdQH2uBlKpvCZb6kQGXqmw
	1LHBWuuPqNHjQXDRpy19IJoWg9xyqwGNSWL4vJcaXqDLYRiz1wOr/XOiyi8sf7NZyXiGOoiINxBPa
	GhEiWr41U/tZqU0/oGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFzDK-004VSf-5U; Fri, 04 Feb 2022 14:05:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFzDG-004VRA-Ii
 for ath11k@lists.infradead.org; Fri, 04 Feb 2022 14:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643983521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dayGXsFIzzfdfyY322FvzwebpXv6RGlugkQ2hX5IJ3Y=;
 b=BCTcUmI0WAidcrSp6QWk3scTxamt2FB1+D+8Z/YGDM++QCrTgoHrYcq9nfpCjxanZVZPC0
 jc4b6hIK5XSCuXrwhru2PBxXNhOjrw9XBvVUM/iRmBxuph9QYIjLV6xSvIv7pxscqJQMmj
 qK6PTD9BejTbZ5/JD+VeZxYFZRbBGYY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-ZCMqdpdAOcONJRTA6wu1gQ-1; Fri, 04 Feb 2022 09:05:10 -0500
X-MC-Unique: ZCMqdpdAOcONJRTA6wu1gQ-1
Received: by mail-io1-f70.google.com with SMTP id
 y124-20020a6bc882000000b0060fbfe14d03so4182342iof.2
 for <ath11k@lists.infradead.org>; Fri, 04 Feb 2022 06:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dayGXsFIzzfdfyY322FvzwebpXv6RGlugkQ2hX5IJ3Y=;
 b=jnxsGJK+2YA6nxWCKR0o55w8IZwKHtJAMVKQMfEhZx9PFdh/une0AF74Mx3sSbuLBN
 aPnnC4dbiwUfMCZyFoyBxH4URl4QF/hntLwR93LnpczDKfhK2aYaVfjPvu+vkJAHFGps
 YCXkNWuuUOiKbQ2k+pTW/5vGlasi3h3k/3E9xEAiXGHLm0pN/CH0vBhqP7BUfgkBOuw/
 uUXvBQLxlYfqsKw5MZOFqqBMBnHBLjplha7fQy6CiAB+IqqeXpEROtEZ6w+JkQ1IaK2Q
 g35F/H7IPJ5+sc0bk9sXevCQWGJ0Qyubotgdgtbz3LmG7Pd+DHElTqWthbbu0tXrz32x
 PkNA==
X-Gm-Message-State: AOAM5321EFBeHv/0vkCWkWwj4Yq+ruv3ygGMRqm0ifbVIuKIJN//ThaN
 qJ1r0hc2ezmWwQAIKZIiaBzCtnihDux3Uh6rjlRgbuUOOOKLRlXomkwEVLKgsEeKvgscJzXzWTN
 d3+K7QPzeqOxGMKOVTgKLsX8/3cn0EBbP7UDVAQ==
X-Received: by 2002:a02:824e:: with SMTP id q14mr1391736jag.0.1643983510021;
 Fri, 04 Feb 2022 06:05:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpaG34RYf+cJLaSqWJF6Wqtu/zrs/yr1Vtb4DZhZfYBUpbL1Exc1+V/w3A1/AnsJDM+hEy+rUZVwQFclBw/G4=
X-Received: by 2002:a02:824e:: with SMTP id q14mr1391710jag.0.1643983509596;
 Fri, 04 Feb 2022 06:05:09 -0800 (PST)
MIME-Version: 1.0
References: <CACT4oud4hmkjrAPkOr0sG1DNNgcgQaKT2JNJzcivZey9b5Hpiw@mail.gmail.com>
 <1926320.a6RdWSqejM@sven-l14>
In-Reply-To: <1926320.a6RdWSqejM@sven-l14>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Fri, 4 Feb 2022 15:04:58 +0100
Message-ID: <CACT4oue1KcYkxnNUM4fJ8w-TR6Tiu5OekWYctaDRoo7md37dtA@mail.gmail.com>
Subject: Re: failed to fetch board data
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ihuguet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_060522_716902_0E5FD1B3 
X-CRM114-Status: GOOD (  13.55  )
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

SGksCgpPbiBUaHUsIEZlYiAzLCAyMDIyIGF0IDc6NDIgUE0gU3ZlbiBFY2tlbG1hbm4gPHN2ZW5A
bmFyZmF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHVyc2RheSwgMyBGZWJydWFyeSAyMDIyIDE1
OjU2OjI5IENFVCDDjcOxaWdvIEh1Z3VldCB3cm90ZToKPiA+IFNpbmNlIGl0IHNlZW1zIHRoYXQg
dGhlcmUgbWlnaHQgYmUgbWFueSB2YXJpYW50cyB0aGF0IG5lZWQgdG8gYmUga25vd24KPiA+IGlu
IHRoZSBib2FyZC0yLmJpbiBmaWxlLCBpcyBpdCBwb3NzaWJsZSB0byBrbm93IHdoaWNoIG9uZXMg
YXJlCj4gPiBzdXBwb3J0ZWQgYW5kIHdoaWNoIG9uZXMgYXJlIG5vdD8KPgo+ICAgICBnaXQgY2xv
bmUgaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDExay1maXJtd2FyZQo+ICAgICBnaXQgY2xv
bmUgaHR0cHM6Ly9naXRodWIuY29tL3FjYS9xY2Etc3dpc3MtYXJteS1rbmlmZQo+Cj4gICAgIC4v
cWNhLXN3aXNzLWFybXkta25pZmUvdG9vbHMvc2NyaXB0cy9hdGgxMWsvYXRoMTFrLWJkZW5jb2Rl
ciAtaSBhdGgxMWstZmlybXdhcmUvV0NONjg1NS9odzIuMC9ib2FyZC0yLmJpbnxncmVwIEJvYXJk
TmFtZQo+Cj4gV2hpY2ggcmV0dXJucyBmb2xsb3dpbmcgbGlzdDoKPgo+ICAgICBCb2FyZE5hbWVz
WzBdOiAnYnVzPXBjaSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVuZG9yPTE3
Y2Isc3Vic3lzdGVtLWRldmljZT0zMzc0LHFtaS1jaGlwLWlkPTIscW1pLWJvYXJkLWlkPTI2MicK
PiAgICAgQm9hcmROYW1lc1sxXTogJ2J1cz1wY2ksdmVuZG9yPTE3Y2IsZGV2aWNlPTExMDMsc3Vi
c3lzdGVtLXZlbmRvcj0xN2NiLHN1YnN5c3RlbS1kZXZpY2U9MzM3NCxxbWktY2hpcC1pZD0yLHFt
aS1ib2FyZC1pZD0yNjYnCj4gICAgIEJvYXJkTmFtZXNbMl06ICdidXM9cGNpLHZlbmRvcj0xN2Ni
LGRldmljZT0xMTAzLHN1YnN5c3RlbS12ZW5kb3I9MTdjYixzdWJzeXN0ZW0tZGV2aWNlPTMzNzQs
cW1pLWNoaXAtaWQ9MTgscW1pLWJvYXJkLWlkPTI2NicKPiAgICAgQm9hcmROYW1lc1szXTogJ2J1
cz1wY2ksdmVuZG9yPTE3Y2IsZGV2aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0xNGNkLHN1YnN5
c3RlbS1kZXZpY2U9OTQwOSxxbWktY2hpcC1pZD0xOCxxbWktYm9hcmQtaWQ9MjU1Jwo+ICAgICBC
b2FyZE5hbWVzWzRdOiAnYnVzPXBjaSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0t
dmVuZG9yPTE0Y2Qsc3Vic3lzdGVtLWRldmljZT05NDA5LHFtaS1jaGlwLWlkPTIscW1pLWJvYXJk
LWlkPTI1NScKPiAgICAgQm9hcmROYW1lc1s1XTogJ2J1cz1wY2ksdmVuZG9yPTE3Y2IsZGV2aWNl
PTExMDMsc3Vic3lzdGVtLXZlbmRvcj0xN2NiLHN1YnN5c3RlbS1kZXZpY2U9MDEwOCxxbWktY2hp
cC1pZD0xOCxxbWktYm9hcmQtaWQ9MjU1Jwo+ICAgICBCb2FyZE5hbWVzWzZdOiAnYnVzPXBjaSx2
ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVuZG9yPTE3Y2Isc3Vic3lzdGVtLWRl
dmljZT0wMTA4LHFtaS1jaGlwLWlkPTIscW1pLWJvYXJkLWlkPTI1NScKPiAgICAgQm9hcmROYW1l
c1s3XTogJ2J1cz1wY2ksdmVuZG9yPTE3Y2IsZGV2aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0x
MDViLHN1YnN5c3RlbS1kZXZpY2U9ZTBjZSxxbWktY2hpcC1pZD0yLHFtaS1ib2FyZC1pZD0yNTUn
Cj4gICAgIEJvYXJkTmFtZXNbOF06ICdidXM9cGNpLHZlbmRvcj0xN2NiLGRldmljZT0xMTAzLHN1
YnN5c3RlbS12ZW5kb3I9MTA1YixzdWJzeXN0ZW0tZGV2aWNlPWUwY2UscW1pLWNoaXAtaWQ9MTgs
cW1pLWJvYXJkLWlkPTI1NScKPiAgICAgQm9hcmROYW1lc1s5XTogJ2J1cz1wY2ksdmVuZG9yPTE3
Y2IsZGV2aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0xNGNkLHN1YnN5c3RlbS1kZXZpY2U9OTMw
OCxxbWktY2hpcC1pZD0yLHFtaS1ib2FyZC1pZD0yNTUnCj4gICAgIEJvYXJkTmFtZXNbMTBdOiAn
YnVzPXBjaSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVuZG9yPTE3YWEsc3Vi
c3lzdGVtLWRldmljZT05MzA4LHFtaS1jaGlwLWlkPTIscW1pLWJvYXJkLWlkPTI1NScKPiAgICAg
Qm9hcmROYW1lc1sxMV06ICdidXM9cGNpLHZlbmRvcj0xN2NiLGRldmljZT0xMTAzLHN1YnN5c3Rl
bS12ZW5kb3I9MTdhYSxzdWJzeXN0ZW0tZGV2aWNlPTkzMDkscW1pLWNoaXAtaWQ9MixxbWktYm9h
cmQtaWQ9MjU1Jwo+ICAgICBCb2FyZE5hbWVzWzEyXTogJ2J1cz1wY2ksdmVuZG9yPTE3Y2IsZGV2
aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0xN2FhLHN1YnN5c3RlbS1kZXZpY2U9OTMwOSxxbWkt
Y2hpcC1pZD0xOCxxbWktYm9hcmQtaWQ9MjU1Jwo+ICAgICBCb2FyZE5hbWVzWzEzXTogJ2J1cz1w
Y2ksdmVuZG9yPTE3Y2IsZGV2aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0xN2FhLHN1YnN5c3Rl
bS1kZXZpY2U9ZTBiZSxxbWktY2hpcC1pZD0yLHFtaS1ib2FyZC1pZD0yNTUnCj4gICAgIEJvYXJk
TmFtZXNbMTRdOiAnYnVzPXBjaSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVu
ZG9yPTEwNWIsc3Vic3lzdGVtLWRldmljZT1lMGJiLHFtaS1jaGlwLWlkPTIscW1pLWJvYXJkLWlk
PTI1NScKPiAgICAgQm9hcmROYW1lc1sxNV06ICdidXM9cGNpLHZlbmRvcj0xN2NiLGRldmljZT0x
MTAzLHN1YnN5c3RlbS12ZW5kb3I9MTA1YixzdWJzeXN0ZW0tZGV2aWNlPWUwYzQscW1pLWNoaXAt
aWQ9MixxbWktYm9hcmQtaWQ9MjU1Jwo+ICAgICBCb2FyZE5hbWVzWzE2XTogJ2J1cz1wY2ksdmVu
ZG9yPTE3Y2IsZGV2aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0xMDViLHN1YnN5c3RlbS1kZXZp
Y2U9ZTBjNCxxbWktY2hpcC1pZD0xOCxxbWktYm9hcmQtaWQ9MjU1Jwo+ICAgICBCb2FyZE5hbWVz
WzE3XTogJ2J1cz1wY2ksdmVuZG9yPTE3Y2IsZGV2aWNlPTExMDMsc3Vic3lzdGVtLXZlbmRvcj0x
N2NiLHN1YnN5c3RlbS1kZXZpY2U9MzM3NCxxbWktY2hpcC1pZD0yLHFtaS1ib2FyZC1pZD03NzEn
Cj4gICAgIEJvYXJkTmFtZXNbMThdOiAnYnVzPXBjaSx2ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxz
dWJzeXN0ZW0tdmVuZG9yPTE3Y2Isc3Vic3lzdGVtLWRldmljZT0zMzc0LHFtaS1jaGlwLWlkPTE4
LHFtaS1ib2FyZC1pZD03NzEnCj4KPiBLZWVwIGluIG1pbmQsIHRoYXQgdGhlcmUgY2FuIGFsc28g
YmUgbXVsdGlwbGUgc3VwcG9ydGVkIHZhbHVlcyBwZXIgbGluZSAoYWthCj4gInBlciBCREYiL2Jv
YXJkLmJpbikuICBUaGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgY2FzZSBiZWNhdXNlIHRoZXJl
IGlzIG5vCj4gZXh0cmEgZW50cnkgKHNlZSBwbGFjZWhvbGRlciAiZm9vYmFyIikgbGlrZSBpbiBm
b2xsb3dpbmcgZXhhbXBsZSA6Cj4KPgo+ICAgICBCb2FyZE5hbWVzW1hYWFhdOiAnYnVzPXBjaSx2
ZW5kb3I9MTdjYixkZXZpY2U9MTEwMyxzdWJzeXN0ZW0tdmVuZG9yPTE0Y2Qsc3Vic3lzdGVtLWRl
dmljZT05NDA5LHFtaS1jaGlwLWlkPTE4LHFtaS1ib2FyZC1pZD0yNTUnLCdmb29iYXInCj4KPiBL
aW5kIHJlZ2FyZHMsCj4gICAgICAgICBTdmVuCgpUaGFua3MgZm9yIHRoaXMgaW5mbywgaXQncyBy
ZWFsbHkgdXNlZnVsLgoKSSBhc3N1bWUgdGhhdCB0byBnZXQgdGhlIGNhcmQgc3VwcG9ydGVkIEkg
Y2FuIG9ubHkgd2FpdCBpdCB0byBiZSBhZGRlZAppbiBrdmFsbyBmaXJtd2FyZSByZXBvLCByaWdo
dD8KCgotLSAKw43DsWlnbyBIdWd1ZXQKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
