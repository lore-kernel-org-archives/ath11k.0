Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAB9C433FE
	for <ath11k@archiver.kernel.org>; Wed, 23 Nov 2022 03:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gScUS2EnkrEa1wADCJqM0wZ9Bs840sfdy9blC/1BMLw=; b=dlxTll13MXejDu
	OT7/sHs1ymXpgdWDkZLZfzTPq/siNfpA5XPymV7Y+m5M8WkOZbrd6k786E0t/jxdcAwxFniofE6w1
	v+e5Fm/3S+R9Ri2qFNyJMySAxjTs2UVDAyP4ABNiP1elqicnlWXQ3ef2EQAhoh/xU33j1IvAOwCI6
	FltfPXBfWLI+6oG1cAtKwZkDQiioQuAtoxw0FYNwuf33cgidVUUx4nX9o4ZCeFW8BbenvPDFlOStI
	NrCqkuOmzfvzBmtPTyymWj03Rj1ws7b4mEC5vTg+I/g40RrDaJqyyUr7rbm8Akaoay37HfzxT8e02
	2Z7QSRo6nMM4tQ+WnJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxgdq-00DbCm-If; Wed, 23 Nov 2022 03:41:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxgdn-00Db9Z-N7
	for ath11k@lists.infradead.org; Wed, 23 Nov 2022 03:41:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN2fMBe023623;
	Wed, 23 Nov 2022 03:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eGzzukjTuIWTfYBwo3GDLtYJqd+V27Mca1HLgoxlagU=;
 b=U4lPgne755B0ClR7iLDAsdcJneEyStjLsd/VgoJV7L2ITCpOuKqkldSUM7TozfAZAs9x
 xgQft0mXxbaH/v0cPP6y/7TFApp0j81wfqmZjxvzO7LOd87trutpjzM7V2JL3NszYT0n
 9lyMWsaW2JhNfSnVVXsRCHh1ZBtaOeIebiCHCBT4pbnZFD0LnzFL4OBHGcFZ2gCORkvr
 G+rXB0t2AaMHvCSbuGDQ0BRUJQ8aXFR8o0agCcGkvG0R7Jg+EqMVS7IxtXYWwWV95oEu
 v+tQFQiS2BIU/5LVp2hmLt3bbWy49rLhpnPrU8CRO8gGRSLT0tEUpftnAcGW7aU2wGvN Ug== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m0q6xb6bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 03:41:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AN3fSF8012423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 03:41:28 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 22 Nov
 2022 19:41:27 -0800
Message-ID: <e7e34c3d-8b73-f7d5-9ce8-5ed346ca9d28@quicinc.com>
Date: Wed, 23 Nov 2022 11:41:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw
 scan from 10 seconds to 1 second
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
 <20221011072408.23731-3-quic_wgong@quicinc.com> <8735atg335.fsf@kernel.org>
 <cd96eea8-dce0-bcb9-e8ce-05fa0e0f22fb@quicinc.com>
In-Reply-To: <cd96eea8-dce0-bcb9-e8ce-05fa0e0f22fb@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K1TxHWZRUqRdZXTmHehE4lQs2w_uPGwD
X-Proofpoint-ORIG-GUID: K1TxHWZRUqRdZXTmHehE4lQs2w_uPGwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_194139_808975_B6BB60EF 
X-CRM114-Status: GOOD (  20.03  )
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

T24gMTEvMTgvMjAyMiA2OjI5IFBNLCBXZW4gR29uZyB3cm90ZToKPiBPbiAxMS84LzIwMjIgNjoy
MCBQTSwgS2FsbGUgVmFsbyB3cm90ZToKPj4gV2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5j
b20+IHdyaXRlczoKPj4KPiAuLi4KPj4gWy4uLl0KPj4KPj4+IEBAIC0zNjgyLDcgKzM2NzcsMTIg
QEAgc3RhdGljIGludCBhdGgxMWtfbWFjX29wX2h3X3NjYW4oc3RydWN0IAo+Pj4gaWVlZTgwMjEx
X2h3ICpodywKPj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gYXRoMTFrX3N0YXJ0X3NjYW4oYXIsICZh
cmcpOwo+Pj4gwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgYXRoMTFr
X3dhcm4oYXItPmFiLCAiZmFpbGVkIHRvIHN0YXJ0IGh3IHNjYW46ICVkXG4iLCByZXQpOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgPT0gLUVCVVNZKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYXRoMTFrX2RiZyhhci0+YWIsIEFUSDExS19EQkdfTUFDLAo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAic2NhbiBlbmdpbmUgaXMgYnVzeSAxMWQgc3RhdGUg
JWRcbiIsIAo+Pj4gYXItPnN0YXRlXzExZCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRoMTFrX3dhcm4oYXItPmFiLCAiZmFpbGVkIHRvIHN0
YXJ0IGh3IHNjYW46ICVkXG4iLCByZXQpOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNw
aW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYXItPnNj
YW4uc3RhdGUgPSBBVEgxMUtfU0NBTl9JRExFOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5f
dW5sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsKPj4gVGhpcyBmZWVscyBsaWtlIGEgaGFjayB0byBt
ZSwgZm9yIGV4YW1wbGUgd2lsbCB0aGVzZSBmYWlsZWQgc2NhbnMgbm93Cj4+IGNhdXNlIGRlbGF5
cyBpcyBjb25uZWN0aW9uIGVzdGFibGlzaG1lbnQ/IElNSE8gaXQncyBjcnVjaWFsIGZyb20gdXNl
cidzCj4+IHBvaW50IG9mIHZpZXcgdGhhdCB3ZSBkb24ndCBkZWxheSB0aGF0IGluIGFueSB3YXku
Cj4gSXQgd2lsbCBub3QgZGVsYXkgY29ubmVjdGlvbi4KPiBBZnRlciB3bGFuIGxvYWQsIHRoZSAx
c3QgaHcgc2NhbiB3aWxsIGFycml2ZWQgdG8gYXRoMTFrLCBhbmQgdGhlbiAxMWQKPiBzY2FuIHdp
bGwgYmUgc2VudCB0byBmaXJtd2FyZSBhZnRlciB0aGUgMXN0IGh3IHNjYW4uIEl0IG1lYW5zIHRo
ZSBodwo+IHNjYW4gZm9yIGNvbm5lY3Rpb24gaXMgcnVuIGJlZm9yZSAxMWQgc2NhbiwgYW5kIHRo
ZW4gY29ubmVjdGlvbiBjb3VsZAo+IGJlIHN0YXJ0ZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIDFz
dCBodyBzY2FuIGZpbmlzaGVkLiBJdCBtZWFucyBubwo+IGRlbGF5IGZvciBjb25uZWN0aW9uLgo+
PiBJIHdvdWxkIHJhdGhlciBmaXggdGhlIHJvb3QgY2F1c2UsIGRvIHdlIGtub3cgd2hhdCdzIGNh
dXNpbmcgdGhpcz8KPiBJbiBmaXJtd2FyZSwgaHcgc2NhbiBhbmQgMTFkIHNjYW4gYXJlIGFsbCBy
dW5uaW5nIGluIHRoZSBzYW1lIHF1ZXVlLAo+IHRoZXkgY2FuIG5vdCBiZSBydW4gcGFyYWxsZWwu
Cj4KPiBXaGVuIDYgR0h6IGVuYWJsZWQsIHRoZSAxc3QgaHcgc2NhbiBjb3N0IGFib3V0IDdzIGFu
ZCBmaW5pc2hlZCwgYW5kCj4gdGhlbiAxMWQgc2NhbiBjb3N0IHRoZSBuZXh0IDdzLiBBZnRlciB0
aGUgMTRzLCB0aGUgZWFjaCBodyBzY2FuIGFycml2ZWQKPiB0byBhdGgxMWsgd2lsbCBiZSBydW4g
aW1tZWRpYXRlbHkuIElmIHRoZSAybmQgaHcgc2NhbiBhcnJpdmVkIGJlZm9yZQo+IHRoZSAxMWQg
c2NhbiBmaW5pc2hlZCwgZm9yIGV4YW1wbGUsIGl0IGFycml2ZWQgNy4xIHNlY29uZHMgYWZ0ZXIg
dGhlCj4gMXN0IGh3IHNjYW4sIGF0IHRoaXMgbW9tZW50LCB0aGUgMTFkIHNjYW4gaXMgc3RpbGwg
cnVubmluZyBpbiBmaXJtd2FyZSwKPiB0aGVuIHRoZSAybmQgaHcgc2NhbiB3aWxsIG5vdCByZWNl
aXZlIHNjYW4gc3RhcnRlZCBldmVudCB1bnRpbGwgdGhlIDExZAo+IHNjYW4gZmluaXNoZWQsIGFu
ZCBtZWFud2hpbGUsIHRoZSAybmQgaHcgc2NhbiBpcyBob2xkaW5nIHRoZSAKPiBhci0+Y29uZl9t
dXRleAo+IGluIGF0aDExa19tYWNfb3BfaHdfc2NhbigpLCBpdCBpcyBub3QgZ29vZCB0byBob2xk
IGEgbG9jayBmb3Igc29tZQo+IHNlY29uZHMgYmVjYXVzZSBhci0+Y29uZl9tdXRleCBpcyB3aWRl
bHkgdXNlZC4gU28gcmVkdWNlIHRoZSAxMHMgdG8gMXMKPiB0byBhdm9pZCBob2xkaW5nIGFyLT5j
b25mX211dGV4IGZvciBsb25nIHRpbWUuCgpIaSBLYWxsZSwKClNob3VsZCBJIGNoYW5nZSBjb21t
aXQgbG9nIHdpdGggYWJvdmUgZXhwbGFuYXRpb24gYW5kIHNlbmQgdjQ/CgoKLS0gCmF0aDExayBt
YWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
