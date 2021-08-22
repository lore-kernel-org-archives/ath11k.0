Return-Path: <SRS0=LqZK=NN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BA8C4338F
	for <ath11k@archiver.kernel.org>; Sun, 22 Aug 2021 21:08:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01ED46137A
	for <ath11k@archiver.kernel.org>; Sun, 22 Aug 2021 21:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01ED46137A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a2fE9P5geqDh5ZGp+T+/b1IUEqVWiLZKGeZuM3SuahY=; b=rz9o+HF6ey7uYy
	peuxGQQv9GiRlwmqQMdK3JM/m8ugQGpR3igZH3LSR4h5syJXrchYRuLwWYU7mQ14evAxdAY9pUH/a
	iwQDVxh6iEMymUyO/dSp5NZoDQ3szXCvRUg5ICaLlOMM1Zg/PNM80cS1zRudEO6fQ7Xn/BSZBHw85
	g+GWDeJ2nA56i+cQrK9DXTjtmV/hVUlEldoXnSqjuhpvtgK9aZ+RozxjPNZKCn31ikRWYilx2kavn
	AhClbEmoscteeg03F8ZVwZZc1JrpJZV2aWklLL1y632BdvAAvwTFfji8w6azTC/bXLQOxrm2lr3YT
	iO+/DuWcSPua5rFAiebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHuha-00Ekw5-Db; Sun, 22 Aug 2021 21:08:22 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHuhV-00EkuB-C5
 for ath11k@lists.infradead.org; Sun, 22 Aug 2021 21:08:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so10793833pjb.2
 for <ath11k@lists.infradead.org>; Sun, 22 Aug 2021 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=penguintechs.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=uSUMUsWoq6qFe4Rlj2GKFuoORjIxglId4owyXgmOtqY=;
 b=NWybloPNY0uYaCNuxy7kKTdmrnp6224trbWKBO5J9UfDG9Nah1hnocPcVo7YQfGreV
 8+g8GHigWN+k4gehPfxAhu+vZVqGsit0ewC2qqMiR71G5XqRXXQuHMgOIeEeMxv5fv3M
 Msmr156xlgRKdq0CIqpzbmnneWIQ2BUL88I84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=uSUMUsWoq6qFe4Rlj2GKFuoORjIxglId4owyXgmOtqY=;
 b=XkFDfUerZ5rTpPUUWeP7Qq8IuhlsHWXlcrFD2Sl3+DscE4WnhyjfX4KrpwiqtI/7xg
 KmAzjLpSgnFE8BEADeui5sSKYm6/SuA3aCsZpMHbKJhI3x17bQX9OlksRDwEfAxYMee4
 4qAIYTsfeniJosAIW00ZtpfJmMmwcd254FKCZ8wPui/V3E7ZRmkPpHZmPUeBbjl9ORuS
 0Yj7LWObnZJ9fZmkW5amVuCXDKdhgrTytTXs8YDV+Y7cmvRNlRJNx7tZXlhj9C+ZnaKp
 FW9SIUYs5tJXJ+JuDuOVxvEWhVophKP2qlj4uXW5/peZ6JNq4n+SwuTl4Sg9EEmzujge
 pnyw==
X-Gm-Message-State: AOAM530yqEoBj9FS6D+sc8v/mxI5KaDTkvmmbqgT+bW9mx6UNjkI2swY
 Ae9FJWHWMS1xjf2cvCL5hB5CMmPtlppVrA==
X-Google-Smtp-Source: ABdhPJwfJBQy6MNHIFFVU3FGFkHEIjWKrHwzXNpCYnA+vsFsnXrT0WEGTWbK0DerZNpZ4zRcS3fy+g==
X-Received: by 2002:a17:90b:fd3:: with SMTP id
 gd19mr16372457pjb.76.1629666494116; 
 Sun, 22 Aug 2021 14:08:14 -0700 (PDT)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net.
 [71.202.115.154])
 by smtp.gmail.com with ESMTPSA id o73sm2797240pfg.175.2021.08.22.14.08.12
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 14:08:13 -0700 (PDT)
To: ath11k@lists.infradead.org
From: Wren Turkal <wt@penguintechs.org>
Subject: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
Message-ID: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
Date: Sun, 22 Aug 2021 14:08:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_140817_504799_E6BCC398 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SSBoYXZlIG5vIGRldmljZSBmb3IgdGhlIHdpZmkgb24gbXkgY29tcHV0ZXIuIDUuMTMgd29ya2Vk
IHByZXR0eSB3ZWxsLiBJIAphbHNvIGZvdW5kIG90aGVycyByZXBvcnRpbmcgc2ltaWxhciBpc3N1
ZXM6Cmh0dHBzOi8vZm9ydW0ubWFuamFyby5vcmcvdC9rZXJuZWw1LTE0LXJjNi1hdGgxMWstb24t
cWNhNjM5MC1yZWdyZXNzaW9uLW1oaS1wcm9iZS1mYWlsdXJlLzc5MzYyCgpIZXJlJ3MgaW5mbyBh
Ym91dCB0aGUgaGFyZHdhcmUgb24gbXkgbGFwdG9wOgrinpwgIH4gc3VkbyBkbWlkZWNvZGUgLXMg
c3lzdGVtLXByb2R1Y3QtbmFtZQpYUFMgMTMgOTMxMAoK4p6cICB+IHN1ZG8gZG1pZGVjb2RlIC1z
IGJpb3MtdmVyc2lvbgozLjAuNAoK4p6cICB+IHN1ZG8gbHNwY2kgLXMgNzI6MDAgLXZ2dgo3Mjow
MC4wIFVuYXNzaWduZWQgY2xhc3MgW2ZmMDBdOiBRdWFsY29tbSBRQ0E2MzkwIFdpcmVsZXNzIE5l
dHdvcmsgCkFkYXB0ZXIgW0FYNTAwLURCUyAoMngyKV0KCVN1YnN5c3RlbTogUml2ZXQgTmV0d29y
a3MgRGV2aWNlIGE1MDEKCUNvbnRyb2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNsZS0g
TWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gClN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJ
TlR4KwoJU3RhdHVzOiBDYXArIDY2TUh6LSBVREYtIEZhc3RCMkItIFBhckVyci0gREVWU0VMPWZh
c3QgPlRBYm9ydC0gPFRBYm9ydC0gCjxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KCUxhdGVu
Y3k6IDAKCUludGVycnVwdDogcGluID8gcm91dGVkIHRvIElSUSAxNzkKCVJlZ2lvbiAwOiBNZW1v
cnkgYXQgYTI1MDAwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MU1dCglDYXBh
YmlsaXRpZXM6IFs0MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMKCQlGbGFnczogUE1FQ2xr
LSBEU0ktIEQxLSBEMi0gQXV4Q3VycmVudD0wbUEgUE1FKEQwKyxEMS0sRDItLEQzaG90KyxEM2Nv
bGQrKQoJCVN0YXR1czogRDAgTm9Tb2Z0UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAg
UE1FLQoJQ2FwYWJpbGl0aWVzOiBbNTBdIE1TSTogRW5hYmxlKyBDb3VudD0zMi8zMiBNYXNrYWJs
ZSsgNjRiaXQtCgkJQWRkcmVzczogZmVlMDBjMTggIERhdGE6IDAwMDAKCQlNYXNraW5nOiBmZmZm
ZmMwMCAgUGVuZGluZzogMDAwMDAwMDAKCUNhcGFiaWxpdGllczogWzcwXSBFeHByZXNzICh2Mikg
RW5kcG9pbnQsIE1TSSAwMAoJCURldkNhcDoJTWF4UGF5bG9hZCAxMjggYnl0ZXMsIFBoYW50RnVu
YyAwLCBMYXRlbmN5IEwwcyB1bmxpbWl0ZWQsIEwxIAp1bmxpbWl0ZWQKCQkJRXh0VGFnLSBBdHRu
QnRuLSBBdHRuSW5kLSBQd3JJbmQtIFJCRSsgRkxSZXNldC0gU2xvdFBvd2VyTGltaXQgMTAuMDAw
VwoJCURldkN0bDoJQ29yckVyci0gTm9uRmF0YWxFcnItIEZhdGFsRXJyLSBVbnN1cFJlcS0KCQkJ
Umx4ZE9yZCsgRXh0VGFnLSBQaGFudEZ1bmMtIEF1eFB3ci0gTm9Tbm9vcCsKCQkJTWF4UGF5bG9h
ZCAxMjggYnl0ZXMsIE1heFJlYWRSZXEgNTEyIGJ5dGVzCgkJRGV2U3RhOglDb3JyRXJyKyBOb25G
YXRhbEVyci0gRmF0YWxFcnItIFVuc3VwUmVxKyBBdXhQd3IrIFRyYW5zUGVuZC0KCQlMbmtDYXA6
CVBvcnQgIzAsIFNwZWVkIDhHVC9zLCBXaWR0aCB4MSwgQVNQTSBMMHMgTDEsIEV4aXQgTGF0ZW5j
eSBMMHMgCjwxdXMsIEwxIDw2NHVzCgkJCUNsb2NrUE0tIFN1cnByaXNlLSBMTEFjdFJlcC0gQndO
b3QtIEFTUE1PcHRDb21wKwoJCUxua0N0bDoJQVNQTSBEaXNhYmxlZDsgUkNCIDY0IGJ5dGVzLCBE
aXNhYmxlZC0gQ29tbUNsaysKCQkJRXh0U3luY2gtIENsb2NrUE0tIEF1dFdpZERpcy0gQldJbnQt
IEF1dEJXSW50LQoJCUxua1N0YToJU3BlZWQgNUdUL3MgKGRvd25ncmFkZWQpLCBXaWR0aCB4MSAo
b2spCgkJCVRyRXJyLSBUcmFpbi0gU2xvdENsaysgRExBY3RpdmUtIEJXTWdtdC0gQUJXTWdtdC0K
CQlEZXZDYXAyOiBDb21wbGV0aW9uIFRpbWVvdXQ6IFJhbmdlIEFCQ0QsIFRpbWVvdXREaXMrIE5S
T1ByUHJQLSBMVFIrCgkJCSAxMEJpdFRhZ0NvbXAtIDEwQml0VGFnUmVxLSBPQkZGIE5vdCBTdXBw
b3J0ZWQsIEV4dEZtdC0gRUVUTFBQcmVmaXgtCgkJCSBFbWVyZ2VuY3lQb3dlclJlZHVjdGlvbiBO
b3QgU3VwcG9ydGVkLCBFbWVyZ2VuY3lQb3dlclJlZHVjdGlvbkluaXQtCgkJCSBGUlMtIFRQSENv
bXArIEV4dFRQSENvbXAtCgkJCSBBdG9taWNPcHNDYXA6IDMyYml0LSA2NGJpdC0gMTI4Yml0Q0FT
LQoJCURldkN0bDI6IENvbXBsZXRpb24gVGltZW91dDogNTB1cyB0byA1MG1zLCBUaW1lb3V0RGlz
LSBMVFIrIE9CRkYgRGlzYWJsZWQsCgkJCSBBdG9taWNPcHNDdGw6IFJlcUVuLQoJCUxua0NhcDI6
IFN1cHBvcnRlZCBMaW5rIFNwZWVkczogMi41LThHVC9zLCBDcm9zc2xpbmstIFJldGltZXItIAoy
UmV0aW1lcnMtIERSUy0KCQlMbmtDdGwyOiBUYXJnZXQgTGluayBTcGVlZDogNUdUL3MsIEVudGVy
Q29tcGxpYW5jZS0gU3BlZWREaXMtCgkJCSBUcmFuc21pdCBNYXJnaW46IE5vcm1hbCBPcGVyYXRp
bmcgUmFuZ2UsIEVudGVyTW9kaWZpZWRDb21wbGlhbmNlLSAKQ29tcGxpYW5jZVNPUy0KCQkJIENv
bXBsaWFuY2UgRGUtZW1waGFzaXM6IC02ZEIKCQlMbmtTdGEyOiBDdXJyZW50IERlLWVtcGhhc2lz
IExldmVsOiAtNmRCLCBFcXVhbGl6YXRpb25Db21wbGV0ZS0gCkVxdWFsaXphdGlvblBoYXNlMS0K
CQkJIEVxdWFsaXphdGlvblBoYXNlMi0gRXF1YWxpemF0aW9uUGhhc2UzLSBMaW5rRXF1YWxpemF0
aW9uUmVxdWVzdC0KCQkJIFJldGltZXItIDJSZXRpbWVycy0gQ3Jvc3NsaW5rUmVzOiB1bnN1cHBv
cnRlZAoJQ2FwYWJpbGl0aWVzOiBbMTAwIHYyXSBBZHZhbmNlZCBFcnJvciBSZXBvcnRpbmcKCQlV
RVN0YToJRExQLSBTREVTLSBUTFAtIEZDUC0gQ21wbHRUTy0gQ21wbHRBYnJ0LSBVbnhDbXBsdC0g
UnhPRi0gCk1hbGZUTFAtIEVDUkMtIFVuc3VwUmVxLSBBQ1NWaW9sLQoJCVVFTXNrOglETFAtIFNE
RVMtIFRMUC0gRkNQLSBDbXBsdFRPLSBDbXBsdEFicnQtIFVueENtcGx0LSBSeE9GLSAKTWFsZlRM
UC0gRUNSQy0gVW5zdXBSZXEtIEFDU1Zpb2wtCgkJVUVTdnJ0OglETFArIFNERVMrIFRMUC0gRkNQ
KyBDbXBsdFRPLSBDbXBsdEFicnQtIFVueENtcGx0LSBSeE9GKyAKTWFsZlRMUCsgRUNSQy0gVW5z
dXBSZXEtIEFDU1Zpb2wtCgkJQ0VTdGE6CVJ4RXJyLSBCYWRUTFAtIEJhZERMTFAtIFJvbGxvdmVy
LSBUaW1lb3V0LSBBZHZOb25GYXRhbEVycisKCQlDRU1zazoJUnhFcnItIEJhZFRMUC0gQmFkRExM
UC0gUm9sbG92ZXItIFRpbWVvdXQtIEFkdk5vbkZhdGFsRXJyKwoJCUFFUkNhcDoJRmlyc3QgRXJy
b3IgUG9pbnRlcjogMDAsIEVDUkNHZW5DYXArIEVDUkNHZW5Fbi0gRUNSQ0Noa0NhcCsgCkVDUkND
aGtFbi0KCQkJTXVsdEhkclJlY0NhcC0gTXVsdEhkclJlY0VuLSBUTFBQZnhQcmVzLSBIZHJMb2dD
YXAtCgkJSGVhZGVyTG9nOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMAoJQ2Fw
YWJpbGl0aWVzOiBbMTQ4IHYxXSBTZWNvbmRhcnkgUENJIEV4cHJlc3MKCQlMbmtDdGwzOiBMbmtF
cXVJbnRycnVwdEVuLSBQZXJmb3JtRXF1LQoJCUxhbmVFcnJTdGF0OiAwCglDYXBhYmlsaXRpZXM6
IFsxNTggdjFdIFRyYW5zYWN0aW9uIFByb2Nlc3NpbmcgSGludHMKCQlObyBzdGVlcmluZyB0YWJs
ZSBhdmFpbGFibGUKCUNhcGFiaWxpdGllczogWzFlNCB2MV0gTGF0ZW5jeSBUb2xlcmFuY2UgUmVw
b3J0aW5nCgkJTWF4IHNub29wIGxhdGVuY3k6IDMxNDU3MjhucwoJCU1heCBubyBzbm9vcCBsYXRl
bmN5OiAzMTQ1NzI4bnMKCUNhcGFiaWxpdGllczogWzFlYyB2MV0gTDEgUE0gU3Vic3RhdGVzCgkJ
TDFTdWJDYXA6IFBDSS1QTV9MMS4yKyBQQ0ktUE1fTDEuMSsgQVNQTV9MMS4yKyBBU1BNX0wxLjEr
IEwxX1BNX1N1YnN0YXRlcysKCQkJICBQb3J0Q29tbW9uTW9kZVJlc3RvcmVUaW1lPTcwdXMgUG9y
dFRQb3dlck9uVGltZT0wdXMKCQlMMVN1YkN0bDE6IFBDSS1QTV9MMS4yKyBQQ0ktUE1fTDEuMSsg
QVNQTV9MMS4yKyBBU1BNX0wxLjErCgkJCSAgIFRfQ29tbW9uTW9kZT0wdXMgTFRSMS4yX1RocmVz
aG9sZD05ODMwNG5zCgkJTDFTdWJDdGwyOiBUX1B3ck9uPTQ0dXMKCUtlcm5lbCBkcml2ZXIgaW4g
dXNlOiBhdGgxMWtfcGNpCglLZXJuZWwgbW9kdWxlczogYXRoMTFrX3BjaQoKVGhhbmtzIGZvciBh
bGwgdGhlIGRldiBvbiB0aGlzLAp3dAotLSAKWW91J3JlIG1vcmUgYW1hemluZyB0aGFuIHlvdSB0
aGluayEgeW1hdHl0LmNvbQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMWsK
