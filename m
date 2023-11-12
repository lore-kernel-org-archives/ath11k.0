Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EDBC4332F
	for <ath11k@archiver.kernel.org>; Sun, 12 Nov 2023 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAo0c1ZJJEAbgx/MHT0upjPcv91jX9DzOie5TZw5qeM=; b=CEvsmnK8mWs7jq
	COpzVtQMYyGPJfDM3CygOGY3MYhppwjrnYBNwTMqaYfPsjTljtuu6wQkAiGELajQIRm9APW55UO8X
	qoQ9+S/1DZ4djxU8VTc+o/xHT9m2PHUoZGu7ft0x6+vV/wx4JP5Y26vEtwJrIVIRO32CqWqyvkgCz
	nzF9q5e1NJYIfk5XoG/rSupTmZRowoD26OZftP5KJoRhpX4KVTwAWJPA4OB8zRKfJgjeB66kIgn4T
	uJ0pflFjSfKv8WrDK7IjdcUK22mwZIVpqVADMm1el/N6RRhJMl0hBcKGvvQnxNXtmI5eoFSYH8OPB
	PAR1GlHGR3tzMs7K/xTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2D7m-00CZe0-0V;
	Sun, 12 Nov 2023 16:15:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2D7i-00CZdG-2s
	for ath11k@lists.infradead.org;
	Sun, 12 Nov 2023 16:15:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ACG0vWm019096;
	Sun, 12 Nov 2023 16:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EjZRLRapeJGE9nRtCrvzmZ0/G6eqt6q1wxe/ljCM6cc=;
 b=EVAtDCsXQHuGjN3+jHm8y3aKF8Xi6WXTQcbbrLl3ZliPc2wR05xifs5ht0D5gZaI3xDI
 ENwXmlPxMcE0TMpo2dEDqdgVcKdUeIWloBXUSabFmjobu3+BNdLdoEk8c97U+5bLzGSE
 wsDvGbU2mBZXk5th+kfUozBhxlCjp2ENPLMG4OSfJno3IK0v8FpQXLrZMVg4VI6axOsh
 FKLMWsur4ZAiDXlrN6jBGvX8b1YhednlQLFnRyj4cBMaSU8R3TKvSkFUT6YJ5wlzgkU+
 6DKNSltqO7Devgqj+RQ9FWu2Ubm/DihdTio+yz/W0paOiPHbOIic+r9od0vdfFP2ozz3 lw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua2sw1x54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 16:15:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ACGFfkX017085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 16:15:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sun, 12 Nov
 2023 08:15:41 -0800
Message-ID: <818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com>
Date: Sun, 12 Nov 2023 09:15:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-5-kvalo@kernel.org>
 <f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
 <e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ch8vXW29ui1GbesnmnHfPW209WaOpGuh
X-Proofpoint-GUID: ch8vXW29ui1GbesnmnHfPW209WaOpGuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_15,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=628 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311120142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_081546_971290_590D4542 
X-CRM114-Status: GOOD (  14.45  )
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

T24gMTEvMTEvMjAyMyA5OjI0IFBNLCBCYW9jaGVuIFFpYW5nIHdyb3RlOgo+IAo+IE9uIDExLzEx
LzIwMjMgMTI6NTQgQU0sIEplZmZyZXkgSHVnbyB3cm90ZToKPj4gT24gMTEvMTAvMjAyMyAzOjIx
IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+Pj4gRnJvbTogQmFvY2hlbiBRaWFuZyA8cXVpY19icWlh
bmdAcXVpY2luYy5jb20+Cj4+Pgo+Pj4gVGhlcmUgaXMgbm8gZHJpdmVyIHRvIG1hdGNoIHRoZXNl
IHR3byBjaGFubmVscywgc28KPj4+IHJlbW92ZSB0aGVtLiBUaGlzIGZpeGVzIHdhcm5pbmdzIGZy
b20gTUhJIHN1YnN5c3RlbSBkdXJpbmcgc3VzcGVuZDoKPj4+Cj4+PiBtaGkgbWhpMF9MT09QQkFD
SzogMTogRmFpbGVkIHRvIHJlc2V0IGNoYW5uZWwsIHN0aWxsIHJlc2V0dGluZwo+Pj4gbWhpIG1o
aTBfTE9PUEJBQ0s6IDA6IEZhaWxlZCB0byByZXNldCBjaGFubmVsLCBzdGlsbCByZXNldHRpbmcK
Pj4KPj4gVGhpcyBmZWVscyBsaWtlIGp1c3QgbWFza2luZyBhIHJlYWwgaXNzdWUuCj4+Cj4+IElm
IExPT1BCQUNLIGlzIG5vdCBiZWluZyBjb25zdW1lZCwgdGhlbiB0aGUgY2hhbm5lbCBzaG91bGQg
bmV2ZXIgZ28gCj4+IGludG8gdGhlIHN0YXJ0IHN0YXRlLsKgIFdoeSB3b3VsZCB3ZSBiZSB0cnlp
bmcgdG8gdHJhbnNpdGlvbiB0byB0aGUgCj4+IHJlc2V0IHN0YXRlIHRoZW4/Cj4+Cj4+IC1KZWZm
Cj4gVGhhdCBpcyBiZWNhdXNlLCB3aXRoIHBhdGNoICdidXM6IG1oaTogaG9zdDogYWRkIG5ldyBp
bnRlcmZhY2VzIHRvIAo+IGhhbmRsZSBNSEkgY2hhbm5lbHMgZGlyZWN0bHknIGluIHRoaXMgcGF0
Y2ggc2V0LCBhdGgxMWsgaXMgYWJsZSB0byBjYWxsIAo+IG1oaV91bnByZXBhcmVfYWxsX2Zyb21f
dHJhbnNmZXIoKSwgd2hpY2ggd2lsbCByZXNldCBhbGwgY2hhbm5lbHMuCgp0aGF0IGltcGxlbWVu
dGF0aW9uIGlzIGZsYXdlZCBpZiBpdCBpcyBjYXVzaW5nIHRoaXMuICBMb29rcyBsaWtlIHlvdSAK
bmV2ZXIgY2hlY2sgdG8gc2VlIGlmIHRoZSBjaGFubmVsIHdhcyBwcmVwYXJlZCBpbiB0aGUgZmly
c3QgcGxhY2UuCgpJZiB5b3UgZ28gZml4IHRoYXQsIHRoZW4gaXQgbG9va3MgbGlrZSB0aGlzIGNo
YW5nZSBpcyBub3QgbmVlZGVkLgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMWsK
