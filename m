Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10390EB64DA
	for <ath11k@archiver.kernel.org>; Wed, 19 Jul 2023 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DZpNElbmudw0dC+UWiSxeSNp1DcUp0ABW8O0LEA8OA=; b=YBL69AcdEG5xDO
	RH9c0Y1vkJ1p4iiQZuOHYh4bClAIU2tvaXWoLAawqI8ty8ROIhLYVOmKII1U+l5sQPUAvT/6GJWWI
	SuQ8BdnbykUZYehuPlxak6sQdpACF8nUsA/6rPp7fraspD8Tcu/NLJoseiMnWFYqZ0HoC6hj4ZWlN
	L4FUWiubIWSmBnzR1osqDPAInccILkFkMDUUufKFrgYhZa05fw/hszIIDtSh0XUXq6Q86IHCE8vma
	+wNRDVboj+f5VkyRM9m06id6MNcaFWlQ24gV6hZHBOi1XZqtCpHmmObIHn42NJI53grsjM/VpPfeX
	wtuvrQQ1sexsRVHTBeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0GJ-005WMq-2C;
	Wed, 19 Jul 2023 06:02:11 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0GI-005WLn-0E
	for ath11k@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1TKpe4IXnzVLSA2xPSb0s8+w6vTjD696bEELmj0GTDo=; b=As0NwbpqFlvyBjxgak739VDi7y
	N0rafc91NSc8KnfwBg71A+7DgvxSYsMvXmzaQ8lelFUFtmAo+6WE+M2jiwFyIadbkkcnEIHbp2LA2
	ueUVk+QoXzczBi1BXELUnuJulOdssYK5umwG3gDRXZ/dCL8qhwBvbPCzX5VXLGx5TuE9hIewhvMMT
	t4ZVBi91va0H/jq18hvOSldohIM1PEinn9yuM80LWKi79Er1U5GgIwM5ug44U7h8nAEoD3jLNCWQr
	1O7HyPwLnhSRvsXgtpfoexm55Jn31cmN6lVMF3gqXSc/v8MZix2OF7CU3tcVtHRCNXbjPnTkoKM+l
	fYvOUjbQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLxsb-00DFRA-2G
	for ath11k@lists.infradead.org;
	Wed, 19 Jul 2023 03:29:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J3BOP3031255;
	Wed, 19 Jul 2023 03:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1TKpe4IXnzVLSA2xPSb0s8+w6vTjD696bEELmj0GTDo=;
 b=Chu2YvrNl2H1BKeCDUeZnVbV1gXvBURpibIVvPR/nKzz70A+RqZ0VnVwt0w0gOHfT7+W
 25etvzv1n4xB1zFK6xFv2O5B/MLk65MkCSObTbGut2XhmSqr+MWOIV3ZxbWPqjooFrIq
 Ke1dJjX5clV/a1BsbHjgLFV9uTx587M4e2PlymYcgfXDr2i21Y/0rUwSRHRrwjD9yGRw
 D8zhYMW6GFdg7stgpbLbYmlS9bT0bIFMUg6/aBMI4qyMpJnHR1ud0GnTXaqvc2rPpZaK
 0Vp2yzGxCpXGIAll5GfGIo/wKiqxf99dzOP7n5hliJzmLDKgE0iesm2g5BcZdAa3yjle /w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwpphj8e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 03:29:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36J3TQG2003477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 03:29:26 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 20:29:24 -0700
Message-ID: <6c0ac15f-8e46-b79c-ea70-e781615aa5b2@quicinc.com>
Date: Wed, 19 Jul 2023 11:29:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <fe21853e8c9a73632e0ca860eef00296@codeaurora.org>
 <5c85b2bcfbffb617c5aa3f55e7ae94a1ab4df743.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <5c85b2bcfbffb617c5aa3f55e7ae94a1ab4df743.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IZbdhbb4pRvZMNsqpeXHhHF5Xh1qFOjA
X-Proofpoint-ORIG-GUID: IZbdhbb4pRvZMNsqpeXHhHF5Xh1qFOjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_19,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=512 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_042934_327516_1D543BAD 
X-CRM114-Status: GOOD (  13.82  )
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

SGkgSm9oYW5uZXMsCk9uIDgvMjYvMjAyMSA2OjU3IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+
IE9uIFRodSwgMjAyMS0wOC0yNiBhdCAxODo1MCArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+IGl0
IGlzIG1lbXNldCBoZXJlIGkgdGhpcyBwYXRjaDoKPiBPb3BzLCBtaXNzZWQgdGhhdC4KPgo+IEJ1
dCBpcyB0aGF0IHJlYWxseSBhIGdvb2QgcGxhY2UgZm9yIGl0PyBEb2Vzbid0IHJlYWxseSBzZWVt
IHRvIGJlbG9uZyB0bwo+IGFzc2lnbmluZyBhIGNoYW5uZWwgY29udGV4dCAtIG1heWJlIHB1dCBp
dCBpbnRvIHNldF9kaXNhc3NvYygpPwo+Cj4gam9oYW5uZXMKV2UgaGl0IGJ1ZmZlciBvdmVyZmxv
dyBpc3N1ZSB3aGlsZSBjb25uZWN0aW5nIHRvIDYgR0h6IEFQIGZhaWwgYW5kIGZhaWwuCldpbGwg
eW91IGZpeCBpdD8gT3IgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gdG8gZml4IGl0PwoKW8Kg
IDIyNy41Mzk5MjhdIHdscDkwczA6IGF1dGhlbnRpY2F0ZSB3aXRoIDAyOjAzOjdmOjEyOjY2OjY2
ClvCoCAyMjcuNjAxODQ2XSB3bHA5MHMwOiBzZW5kIGF1dGggdG8gMDI6MDM6N2Y6MTI6NjY6NjYg
KHRyeSAxLzMpClvCoCAyMjcuNjMzOTAyXSB3bHA5MHMwOiBhdXRoZW50aWNhdGUgd2l0aCAwMjow
Mzo3ZjoxMjo2Njo2NgpbwqAgMjI3LjYzMzkwNl0gd2xwOTBzMDogc2VuZCBhdXRoIHRvIDAyOjAz
OjdmOjEyOjY2OjY2ICh0cnkgMS8zKQpbwqAgMjI3LjY1NzIwM10gd2xwOTBzMDogMDI6MDM6N2Y6
MTI6NjY6NjYgZGVuaWVkIGF1dGhlbnRpY2F0aW9uIChzdGF0dXMgMSkKLi4uClvCoCAyNjMuMDE0
NjYxXSB3bHA5MHMwOiBhdXRoZW50aWNhdGUgd2l0aCAwMjowMzo3ZjoxMjo2Njo2NgpbwqAgMjYz
LjA3NTY2N10gd2xwOTBzMDogc2VuZCBhdXRoIHRvIDAyOjAzOjdmOjEyOjY2OjY2ICh0cnkgMS8z
KQpbwqAgMjYzLjExMjQyN10gd2xwOTBzMDogYXV0aGVudGljYXRlIHdpdGggMDI6MDM6N2Y6MTI6
NjY6NjYKW8KgIDI2My4xMTI0MzNdIHdscDkwczA6IHNlbmQgYXV0aCB0byAwMjowMzo3ZjoxMjo2
Njo2NiAodHJ5IDEvMykKW8KgIDI2My4xMzI1MDddIHdscDkwczA6IDAyOjAzOjdmOjEyOjY2OjY2
IGRlbmllZCBhdXRoZW50aWNhdGlvbiAoc3RhdHVzIDEpClvCoCAyNzkuNjY4NTUxXSB3bHA5MHMw
OiBhdXRoZW50aWNhdGUgd2l0aCAwMjowMzo3ZjoxMjo2Njo2NgpbwqAgMjc5LjcyODg0OF0gd2xw
OTBzMDogc2VuZCBhdXRoIHRvIDAyOjAzOjdmOjEyOjY2OjY2ICh0cnkgMS8zKQpbwqAgMjc5Ljc2
MzY4NV0gd2xwOTBzMDogYXV0aGVudGljYXRlIHdpdGggMDI6MDM6N2Y6MTI6NjY6NjYKW8KgIDI3
OS43NjM2OTZdIHdscDkwczA6IHNlbmQgYXV0aCB0byAwMjowMzo3ZjoxMjo2Njo2NiAodHJ5IDEv
MykKW8KgIDI3OS43OTA4NjddIHdscDkwczA6IDAyOjAzOjdmOjEyOjY2OjY2IGRlbmllZCBhdXRo
ZW50aWNhdGlvbiAoc3RhdHVzIDEpCgpmb3IgYWJvdmUgZmFpbCwgaWVlZTgwMjExX3NldF9kaXNh
c3NvYygpIGlzIG5vdCBjYWxsZWQsIHNvIHRoZQpic3NfY29uZi0+dHhfcHdyX2Vudl9udW0gbmV2
ZXIgcmVzZXQgYW5kIGl0IGlzIGluY3JlYXNlZCBlYWNoCnRpbWUgaW4gaWVlZTgwMjExX3ByZXBf
Y2hhbm5lbCgpLgoKRmluYWxseSB0aGUgYnNzX2NvbmYtPnR4X3B3cl9lbnZfbnVtIGFycml2ZWQg
dG8gMjArKGl0IHNob3VsZCBiZSAxIGZvciAKY29ycmVjdAp2YWx1ZSksIGl0IGhhcyBleGNlZWRl
ZCB0aGUgbWF4IHZhbHVlIElFRUU4MDIxMV9UUEVfTUFYX0lFX0NPVU5UKDgpLCBhbmQKbGVhZCBh
Y2Nlc3MgYnNzX2NvbmYtPnR4X3B3cl9lbnZbSUVFRTgwMjExX1RQRV9NQVhfSUVfQ09VTlRdIG92
ZXJmbG93LgoKW8KgIDMyNy4zOTE2MjFdIHdscDkwczA6IGF1dGhlbnRpY2F0ZSB3aXRoIDAyOjAz
OjdmOjEyOjY2OjY2ClvCoCAzMjcuNDM0MDM2XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UsIGFkZHJlc3M6IAowMDAwMDAwMDAwMDAwMDE4ClvCoCAzMjcuNDM0MDM5XSAjUEY6
IHN1cGVydmlzb3IgcmVhZCBhY2Nlc3MgaW4ga2VybmVsIG1vZGUKW8KgIDMyNy40MzQwNDBdICNQ
RjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90LXByZXNlbnQgcGFnZQpbwqAgMzI3LjQzNDA0Ml0g
UEdEIDAgUDREIDAKW8KgIDMyNy40MzQwNDRdIE9vcHM6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBO
T1BUSQpbwqAgMzI3LjQzNDA0N10gQ1BVOiAyIFBJRDogODA0IENvbW06IHdwYV9zdXBwbGljYW50
IEtkdW1wOiBsb2FkZWQgClRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoCBXwqDCoMKgwqDCoMKgwqDC
oMKgIDYuMi4wLXJjOC13dC1hdGgrICMxMwpbwqAgMzI3LjQzNDA1MF0gSGFyZHdhcmUgbmFtZTog
SW50ZWwoUikgQ2xpZW50IFN5c3RlbXMgCk5VQzExUEhpNy9OVUMxMVBIQmk3LCBCSU9TIFBIVEdM
NTc5LjAwNjMuMjAyMS4wNzA3LjEwNTcgMDcvMDcvMjAyMQpbwqAgMzI3LjQzNDA1Ml0gUklQOiAw
MDEwOmF0aDEya19tYWNfZmlsbF9yZWdfdHBjX2luZm8rMHgyOTIvMHgzYjAgW2F0aDEya10KW8Kg
IDMyNy40MzQwODBdIFJTUDogMDAxODpmZmZmYjczMzAxNjBmNDQ4IEVGTEFHUzogMDAwMTAyNDYK
W8KgIDMyNy40MzQwODFdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAw
MDYgUkNYOiAKMDAwMDAwMDAwMDVhOGY5OApbwqAgMzI3LjQzNDA4Ml0gUkRYOiBmZmZmOWM3ZGUx
Y2I3ZjAwIFJTSTogMDAwMDAwMDAwMDZjZGYxOCBSREk6IApmZmZmOWM3ZGUyMDAwNTA4ClvCoCAz
MjcuNDM0MDg0XSBSQlA6IGZmZmZiNzMzMDE2MGY0YjggUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIw
OTogCmZmZmY5YzdkZTFjYjdmMDAKW8KgIDMyNy40MzQwODRdIFIxMDogZmZmZjljN2RlMjAwMDUw
OCBSMTE6IGZmZmZiNzMzMDE2MGYwZTAgUjEyOiAKZmZmZjljN2RkYTM3NjA5MApbwqAgMzI3LjQz
NDA4NV0gUjEzOiAwMDAwMDAwMDAwMDAwMDAxIFIxNDogMDAwMDAwMDAwMDAwMDAxMCBSMTU6IApm
ZmZmOWM3ZGUyMDAyMDgwClvCoCAzMjcuNDM0MDg2XSBGUzrCoCAwMDAwN2Y4MjU4ZWU5YzAwKDAw
MDApIEdTOmZmZmY5YzgxNzA0ODAwMDAoMDAwMCkgCmtubEdTOjAwMDAwMDAwMDAwMDAwMDAKW8Kg
IDMyNy40MzQwODddIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgw
MDUwMDMzClvCoCAzMjcuNDM0MDg4XSBDUjI6IDAwMDAwMDAwMDAwMDAwMTggQ1IzOiAwMDAwMDAw
MTA4ZmVjMDA2IENSNDogCjAwMDAwMDAwMDA3NzBlZTAKW8KgIDMyNy40MzQwOTBdIFBLUlU6IDU1
NTU1NTU0ClvCoCAzMjcuNDM0MDkwXSBDYWxsIFRyYWNlOgpbwqAgMzI3LjQzNDA5MV3CoCA8VEFT
Sz4KW8KgIDMyNy40MzQwOTRdwqAgYXRoMTJrX21hY192ZGV2X3N0YXJ0X3Jlc3RhcnQrMHg2Yzgv
MHg3ZjAgW2F0aDEya10KW8KgIDMyNy40MzQxMDRdwqAgPyBjcnlwdG9fYWxsb2NfdGZtX25vZGUr
MHg2MC8weDEzMApbwqAgMzI3LjQzNDEwOF3CoCBhdGgxMmtfbWFjX3N0YXRpb25fYWRkKzB4MTYz
LzB4NDQwIFthdGgxMmtdClvCoCAzMjcuNDM0MTE3XcKgIGF0aDEya19tYWNfaGFuZGxlX2xpbmtf
c3RhX3N0YXRlLmlzcmEuNzkrMHg3Ni8weDQyMCBbYXRoMTJrXQpbwqAgMzI3LjQzNDEyNl3CoCBh
dGgxMmtfbWFjX29wX3N0YV9zdGF0ZSsweDE5Zi8weDM1MCBbYXRoMTJrXQpbwqAgMzI3LjQzNDEz
Nl3CoCBkcnZfc3RhX3N0YXRlKzB4ODkvMHg1ZDAgW21hYzgwMjExXQpbwqAgMzI3LjQzNDE2MF3C
oCBzdGFfaW5mb19pbnNlcnRfcmN1KzB4MjIyLzB4NTgwIFttYWM4MDIxMV0KW8KgIDMyNy40MzQx
NzZdwqAgc3RhX2luZm9faW5zZXJ0KzB4Zi8weDIwIFttYWM4MDIxMV0KW8KgIDMyNy40MzQxOTBd
wqAgaWVlZTgwMjExX3ByZXBfY29ubmVjdGlvbisweDIwMC8weDQ5MCBbbWFjODAyMTFdClvCoCAz
MjcuNDM0MjE0XcKgIGllZWU4MDIxMV9tZ2RfYXV0aCsweDJhYS8weDRmMCBbbWFjODAyMTFdClvC
oCAzMjcuNDM0MjM3XcKgID8gX19sb2NhbF9iaF9lbmFibGVfaXArMHgzYi8weDgwClvCoCAzMjcu
NDM0MjM5XcKgID8gX3Jhd19zcGluX3VubG9ja19iaCsweDFkLzB4MzAKW8KgIDMyNy40MzQyNDNd
wqAgaWVlZTgwMjExX2F1dGgrMHgxOC8weDIwIFttYWM4MDIxMV0KW8KgIDMyNy40MzQyNjNdwqAg
Y2ZnODAyMTFfbWxtZV9hdXRoKzB4OTQvMHgxODAgW2NmZzgwMjExXQpbwqAgMzI3LjQzNDI5N13C
oCBubDgwMjExX2F1dGhlbnRpY2F0ZSsweDM5Mi8weDNmMCBbY2ZnODAyMTFdClvCoCAzMjcuNDM0
MzE1XcKgIGdlbmxfZmFtaWx5X3Jjdl9tc2dfZG9pdC5pc3JhLjE5KzB4ZjQvMHgxMjAKW8KgIDMy
Ny40MzQzMThdwqAgZ2VubF9yY3ZfbXNnKzB4MWE1LzB4MmEwClvCoCAzMjcuNDM0MzIwXcKgID8g
X19jZmc4MDIxMV9yZGV2X2Zyb21fYXR0cnMrMHgxZjAvMHgxZjAgW2NmZzgwMjExXQpbwqAgMzI3
LjQzNDMzNl3CoCA/IGNmZzgwMjExX3ByZXBhcmVfY3FtLmlzcmEuNzkrMHgxNzAvMHgxNzAgW2Nm
ZzgwMjExXQpbwqAgMzI3LjQzNDM1Ml3CoCA/IG5sODAyMTFfcHV0X3NpZ25hbC5wYXJ0LjU2KzB4
ZDAvMHhkMCBbY2ZnODAyMTFdClvCoCAzMjcuNDM0MzY4XcKgID8gZ2VubF9nZXRfY21kX2JvdGgr
MHg2MC8weDYwClvCoCAzMjcuNDM0MzcwXcKgIG5ldGxpbmtfcmN2X3NrYisweDVhLzB4MTEwClvC
oCAzMjcuNDM0MzcyXcKgIGdlbmxfcmN2KzB4MjgvMHg0MApbwqAgMzI3LjQzNDM3NF3CoCBuZXRs
aW5rX3VuaWNhc3QrMHgxYmUvMHgyOTAKW8KgIDMyNy40MzQzNzVdwqAgbmV0bGlua19zZW5kbXNn
KzB4Mzc3LzB4NGUwClvCoCAzMjcuNDM0Mzc3XcKgIHNvY2tfc2VuZG1zZysweDlhLzB4YTAKW8Kg
IDMyNy40MzQzODBdwqAgX19fX3N5c19zZW5kbXNnKzB4MjJiLzB4MmYwClvCoCAzMjcuNDM0Mzgy
XcKgIF9fX3N5c19zZW5kbXNnKzB4ODgvMHhkMApbwqAgMzI3LjQzNDM4NF3CoCA/IGRwdXQrMHg1
Zi8weDJlMApbwqAgMzI3LjQzNDM4Nl3CoCA/IF9fZnNub3RpZnlfcGFyZW50KzB4MTA5LzB4MzUw
ClvCoCAzMjcuNDM0Mzg5XcKgIF9fc3lzX3NlbmRtc2crMHg2Yy8weGMwClvCoCAzMjcuNDM0Mzkx
XcKgID8gX19zeXNfc2VuZG1zZysweDZjLzB4YzAKW8KgIDMyNy40MzQzOTNdwqAgX194NjRfc3lz
X3NlbmRtc2crMHgxZi8weDMwClvCoCAzMjcuNDM0Mzk1XcKgIGRvX3N5c2NhbGxfNjQrMHgzNy8w
eDkwClvCoCAzMjcuNDM0Mzk4XcKgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDYz
LzB4Y2QKW8KgIDMyNy40MzQ0MDBdIFJJUDogMDAzMzoweDdmODI1ODkyN2IxNwo+Cj4KPgo+Cgot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
