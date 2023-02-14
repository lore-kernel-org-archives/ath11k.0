Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F1DC64ED8
	for <ath11k@archiver.kernel.org>; Tue, 14 Feb 2023 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slxi0JwQQanR86oCvOsG/nHzGooQi9cJvImsIygls/A=; b=0ANhj8mH7KfaJc
	eOppcLp6e3lM2+WfYErU9dVb7RVtT9jXLfoYd892M+ARJK+XR2fm1dCzX4wDmi+jYp+xxi3P+b7sG
	5NpIaT91JSfbsK5V+GrE38HUTfxNs8DI46nAqz0szNINMNF//4iYWlLyuZsUpb2Zmo3n/g6E7u8Oc
	E7ZpOXpM7ZLLvE+q3M+PG5Y4iq7lPkBTBqJ5bfhCPGPiezI5X+2CkryNXFeL73Zc9tiY3Wukddx81
	BWb4InfpnXyeZlC4HQ7ANUCyLh4Mq3nAwnEAVekq+XM6Eb2xmu/4fhQD0/og8IGVD24a+/CIwSV9x
	bTO/DpD5Zy05qdbNhzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqC5-000OOK-Nx; Tue, 14 Feb 2023 07:57:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqC0-000OJt-S4
	for ath11k@lists.infradead.org; Tue, 14 Feb 2023 07:57:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E6Pji6008737;
	Tue, 14 Feb 2023 07:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hMriGOvRa0Gd301jF1pbpMXT7nBvAydhQTKXRyN2lOo=;
 b=JBahX4wdL8KO/MAtOLQOaKU03JsuWkw6kajk3pySJA0xO4ArfjNIawbyHiyZvhjS94WF
 PMzGBSRtJTMrRoKmW07vzBf7qPFB0qaODSqILA3JF7+JrEpmCwgbHuvJ14PmjTJHuplh
 vuq9/QlESfsg9Zwg6MPzXEnww1sPQp4GfgMDRiCgwepAynsLZYw7oPAG2x4NseoDTYVe
 9XJBaElwpLPqDcxldrgEQr52CQuUCL1IrJnsRoKcnXqfNd4rcqkNcT1jeEqQTRKsbcrG
 RuGUUBLB6RHnrRiHJWa3CXHmd4V6qQFRsRUxuEPePxnXsnjxhsCvLAMwZtBNvKxU70/l GQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqtsusf7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 07:57:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31E7vTMm029906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 07:57:29 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 23:57:27 -0800
Message-ID: <34121f87-4aa6-7f20-fb1e-4d5b02d06f28@quicinc.com>
Date: Tue, 14 Feb 2023 15:57:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 04/15] mac80211: make channel context code MLO-aware
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: Johannes Berg <johannes.berg@intel.com>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
 <20220601093922.fb3f0f434c72.Icea7e695b0626177e27ab73bc8799202d623cebf@changeid>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20220601093922.fb3f0f434c72.Icea7e695b0626177e27ab73bc8799202d623cebf@changeid>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TvjmZLQtYUxVLYfC551Dq83O46nHBZQ4
X-Proofpoint-ORIG-GUID: TvjmZLQtYUxVLYfC551Dq83O46nHBZQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_04,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235737_093088_63925835 
X-CRM114-Status: GOOD (  16.08  )
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

T24gNi8xLzIwMjIgMzozOSBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBGcm9tOiBKb2hhbm5l
cyBCZXJnIDxqb2hhbm5lcy5iZXJnQGludGVsLmNvbT4KPgo+IE1ha2UgdGhlIGNoYW5uZWwgY29u
dGV4dCBjb2RlIE1MTyBhd2FyZSwgYWxvbmcgd2l0aCBzb21lCj4gZnVuY3Rpb25zIHRoYXQgaXQg
dXNlcywgc28gdGhhdCB0aGUgY2hhbi5jIGZpbGUgaXMgbm93Cj4gTUxELWNsZWFuIGFuZCBubyBs
b25nZXIgdXNlcyBkZWZsaW5rL2Jzc19jb25mL2V0Yy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvaGFu
bmVzIEJlcmcgPGpvaGFubmVzLmJlcmdAaW50ZWwuY29tPgouLi4KPiBkaWZmIC0tZ2l0IGEvbmV0
L21hYzgwMjExL3JhdGUuYyBiL25ldC9tYWM4MDIxMS9yYXRlLmMKPiBpbmRleCBmMjIzODExMjc5
NDguLmIyNjgwODg1ODVlYiAxMDA2NDQKPiAtLS0gYS9uZXQvbWFjODAyMTEvcmF0ZS5jCj4gKysr
IGIvbmV0L21hYzgwMjExL3JhdGUuYwo+IEBAIC05MCwxNCArOTAsMTcgQEAgdm9pZCByYXRlX2Nv
bnRyb2xfdHhfc3RhdHVzKHN0cnVjdCBpZWVlODAyMTFfbG9jYWwgKmxvY2FsLAo+ICAgfQo+ICAg
Cj4gICB2b2lkIHJhdGVfY29udHJvbF9yYXRlX3VwZGF0ZShzdHJ1Y3QgaWVlZTgwMjExX2xvY2Fs
ICpsb2NhbCwKPiAtCQkJCSAgICBzdHJ1Y3QgaWVlZTgwMjExX3N1cHBvcnRlZF9iYW5kICpzYmFu
ZCwKPiAtCQkJCSAgICBzdHJ1Y3Qgc3RhX2luZm8gKnN0YSwgdTMyIGNoYW5nZWQpCj4gKwkJCSAg
ICAgIHN0cnVjdCBpZWVlODAyMTFfc3VwcG9ydGVkX2JhbmQgKnNiYW5kLAo+ICsJCQkgICAgICBz
dHJ1Y3Qgc3RhX2luZm8gKnN0YSwgdW5zaWduZWQgaW50IGxpbmtfaWQsCj4gKwkJCSAgICAgIHUz
MiBjaGFuZ2VkKQo+ICAgewo+ICAgCXN0cnVjdCByYXRlX2NvbnRyb2xfcmVmICpyZWYgPSBsb2Nh
bC0+cmF0ZV9jdHJsOwo+ICAgCXN0cnVjdCBpZWVlODAyMTFfc3RhICppc3RhID0gJnN0YS0+c3Rh
Owo+ICAgCXZvaWQgKnByaXZfc3RhID0gc3RhLT5yYXRlX2N0cmxfcHJpdjsKPiAgIAlzdHJ1Y3Qg
aWVlZTgwMjExX2NoYW5jdHhfY29uZiAqY2hhbmN0eF9jb25mOwo+ICAgCj4gKwlXQVJOX09OKGxp
bmtfaWQgIT0gMCk7Cj4gKwo+ICAgCWlmIChyZWYgJiYgcmVmLT5vcHMtPnJhdGVfdXBkYXRlKSB7
Cj4gICAJCXJjdV9yZWFkX2xvY2soKTsKPiAgIAoKV2h5IGxpbmtfaWQgbXVzdCA9IDAgaGVyZT8K
Ck5vdyBJIGhpdCBhIHdhcm5pbmcgaGVyZS4KCls0MjE3NTIuNzQ0Njg0XSB3bGFuMDogW2xpbmsg
MV0gQVAgMDI6MDM6N2Y6MDE6NTI6MjYgY2hhbmdlZCBiYW5kd2lkdGgsIApuZXcgY29uZmlnIGlz
IDY0MzUuMDAwIE1Ieiwgd2lkdGggMSAoNjQzNS4wMDAvMCBNSHopCls0MjE3NTIuNzQ0NzYwXSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KWzQyMTc1Mi43NDQ3NjJdIFdBUk5J
Tkc6IENQVTogNCBQSUQ6IDM4NDQzMDEgYXQgbmV0L21hYzgwMjExL3JhdGUuYzoxMDQgCnJhdGVf
Y29udHJvbF9yYXRlX3VwZGF0ZSsweGUyLzB4MTAwIFttYWM4MDIxMV0KWzQyMTc1Mi43NDQ4MzNd
IE1vZHVsZXMgbGlua2VkIGluOiB0bHMgY3B1aWQgcmZjb21tIGNjbSBtaWNoYWVsX21pYyBjbWFj
IAphbGdpZl9oYXNoIGFsZ2lmX3NrY2lwaGVyIGFmX2FsZyBxcnRyX21oaSBibmVwIGludGVsX3Jh
cGxfbXNyIAppbnRlbF9yYXBsX2NvbW1vbiBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgc25kX2hkYV9j
b2RlY19nZW5lcmljIApsZWR0cmlnX2F1ZGlvIGVkYWNfbWNlX2FtZCBzbmRfaGRhX2NvZGVjX2hk
bWkgc25kX2hkYV9pbnRlbCAKc25kX2ludGVsX2RzcGNmZyBxcnRyIHNuZF9oZGFfY29kZWMga3Zt
X2FtZCBzbmRfaGRhX2NvcmUgYmluZm10X21pc2MgCmF0aDEyayBzbmRfaHdkZXAga3ZtIHNuZF9w
Y20gbWhpIGlycWJ5cGFzcyBxbWlfaGVscGVycyBubHNfaXNvODg1OV8xIApzbmRfc2VxX21pZGkg
Y3JjdDEwZGlmX3BjbG11bCBidHVzYiBzbmRfc2VxX21pZGlfZXZlbnQgCmdoYXNoX2NsbXVsbmlf
aW50ZWwgbWFjODAyMTEgc25kX3Jhd21pZGkgYnRydGwgYWVzbmlfaW50ZWwgY3J5cHRvX3NpbWQg
CnNuZF9zZXEgY3J5cHRkIGJ0YmNtIGJ0aW50ZWwgc25kX3NlcV9kZXZpY2UgcmFwbCBpbnB1dF9s
ZWRzIGJsdWV0b290aCAKam95ZGV2IHdtaV9ibW9mIHNlcmlvX3JhdyBzbmRfdGltZXIgY2ZnODAy
MTEgazEwdGVtcCBlY2RoX2dlbmVyaWMgZWNjIApzbmQgbGliYXJjNCBjY3Agc291bmRjb3JlIHVj
c2lfYWNwaSB0eXBlY191Y3NpIHR5cGVjIG1hY19oaWQgY20zMjE4MSAKaW5kdXN0cmlhbGlvIHNj
aF9mcV9jb2RlbCBtc3IgcGFycG9ydF9wYyBwcGRldiBscCBwYXJwb3J0IHJhbW9vcHMgCnJlZWRf
c29sb21vbiBkcm0gZWZpX3BzdG9yZSBpcF90YWJsZXMgeF90YWJsZXMgYXV0b2ZzNCBheDg4MTc5
XzE3OGEgCnVzYm5ldCBtaWkgaGlkX2dlbmVyaWMgdXNiaGlkIGhpZCBjcmMzMl9wY2xtdWwgbnZt
ZSBhaGNpIGkyY19waWl4NCAKbGliYWhjaSBudm1lX2NvcmUgd21pIHZpZGVvCls0MjE3NTIuNzQ0
OTgyXSBDUFU6IDQgUElEOiAzODQ0MzAxIENvbW06IGt3b3JrZXIvdTMyOjIgS2R1bXA6IGxvYWRl
ZCAKVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKgIFfCoMKgwqDCoMKgwqDCoMKgwqAgNi4wLjAtcmMy
KyAjMwpbNDIxNzUyLjc0NDk4OV0gSGFyZHdhcmUgbmFtZTogQU1EIENlbGFkb24tUk4vQ2VsYWRv
bi1STiwgQklPUyBSQ0QwMDgwQSAKMDkvMDQvMjAxOQpbNDIxNzUyLjc0NDk5M10gV29ya3F1ZXVl
OiBwaHkwIGllZWU4MDIxMV9pZmFjZV93b3JrIFttYWM4MDIxMV0KWzQyMTc1Mi43NDUwNDhdIFJJ
UDogMDAxMDpyYXRlX2NvbnRyb2xfcmF0ZV91cGRhdGUrMHhlMi8weDEwMCBbbWFjODAyMTFdCls0
MjE3NTIuNzQ1MTAwXSBDb2RlOiBlOCBmMyBhMyAzMyBkMCA0OCA4YiA3MyA1MCA0NCA4OSBmMSA0
YyA4OSBlYSA0YyA4OSAKZmYgZTggNzEgMTYgZmUgZmYgNDggODMgYzQgMjAgNWIgNDEgNWMgNDEg
NWQgNDEgNWUgNDEgNWYgNWQgZTkgZGUgMjQgMjAgCmQxIDwwZj4gMGIgZTkgNGMgZmYgZmYgZmYg
MGYgMGIgZTggYzAgYTMgMzMgZDAgZWIgZGQgMGYgMWYgNDAgMDAgNjYgMmUKWzQyMTc1Mi43NDUx
MDRdIFJTUDogMDAxODpmZmZmYWRjMDkxMWVmYWIwIEVGTEFHUzogMDAwMTAyMDIKWzQyMTc1Mi43
NDUxMDldIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmY5ZTg2MTliMjAwMDAgUkNYOiAK
MDAwMDAwMDAwMDAwMDAwMQpbNDIxNzUyLjc0NTExMl0gUkRYOiBmZmZmOWU4NjE5YjIwMDAwIFJT
STogZmZmZjllODQxMmFjMzYxMCBSREk6IApmZmZmOWU4NDEyYWMwOGUwCls0MjE3NTIuNzQ1MTE1
XSBSQlA6IGZmZmZhZGMwOTExZWZhZjggUjA4OiAwMDAwMDAwMDAwMDAwMDAxIFIwOTogCmMwMDAw
MDAxMDBiMWZlMzUKWzQyMTc1Mi43NDUxMTddIFIxMDogZmZmZjllODQxMmFjMDRmMCBSMTE6IGZm
ZmZhZGMwOTExZWY5YzAgUjEyOiAKMDAwMDAwMDAwMDAwMDAwMApbNDIxNzUyLjc0NTEyMF0gUjEz
OiBmZmZmOWU4NjE5YjIwYWIwIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6IApmZmZmOWU4NDEy
YWMwOGUwCls0MjE3NTIuNzQ1MTIzXSBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZm
ZmY5ZTg2ZmY3MDAwMDAoMDAwMCkgCmtubEdTOjAwMDAwMDAwMDAwMDAwMDAKWzQyMTc1Mi43NDUx
MjddIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCls0
MjE3NTIuNzQ1MTMwXSBDUjI6IDAwMDA3ZjAzY2RiMzQ1MzggQ1IzOiAwMDAwMDAwMmYwMjBhMDAw
IENSNDogCjAwMDAwMDAwMDAzNTBlZTAKWzQyMTc1Mi43NDUxMzNdIENhbGwgVHJhY2U6Cls0MjE3
NTIuNzQ1MTM3XcKgIDxUQVNLPgpbNDIxNzUyLjc0NTE0N13CoCBpZWVlODAyMTFfY2hhbl9id19j
aGFuZ2UrMHgxMDAvMHgxMzAgW21hYzgwMjExXQpbNDIxNzUyLjc0NTIxM13CoCBpZWVlODAyMTFf
Y2hhbmdlX2NoYW5jdHgrMHg1MS8weDJhMCBbbWFjODAyMTFdCls0MjE3NTIuNzQ1MjYzXcKgIGll
ZWU4MDIxMV9yZWNhbGNfY2hhbmN0eF9jaGFudHlwZSsweDEzMy8weDE4MCBbbWFjODAyMTFdCls0
MjE3NTIuNzQ1Mjg3XcKgIGllZWU4MDIxMV9saW5rX2NoYW5nZV9iYW5kd2lkdGgrMHhmNS8weDE4
MCBbbWFjODAyMTFdCls0MjE3NTIuNzQ1MzA2XcKgIGllZWU4MDIxMV9yeF9tZ210X2JlYWNvbisw
eGM4Mi8weDFiMzAgW21hYzgwMjExXQpbNDIxNzUyLjc0NTMzM13CoCA/IHVwZGF0ZV9sb2FkX2F2
ZysweDIyNC8weDc3MApbNDIxNzUyLjc0NTMzOF3CoCA/IHVwZGF0ZV9sb2FkX2F2ZysweDIyNC8w
eDc3MApbNDIxNzUyLjc0NTMzOV3CoCA/IG5hdGl2ZV9zZW5kX2NhbGxfZnVuY19zaW5nbGVfaXBp
KzB4MWUvMHgzMApbNDIxNzUyLjc0NTM0NF3CoCBpZWVlODAyMTFfc3RhX3J4X3F1ZXVlZF9tZ210
KzB4MTczLzB4YWQwIFttYWM4MDIxMV0KWzQyMTc1Mi43NDUzNjRdwqAgPyBuZXdpZGxlX2JhbGFu
Y2UrMHgyNTYvMHg0MTAKWzQyMTc1Mi43NDUzNjddwqAgPyBwcmVlbXB0X2NvdW50X2FkZCsweDdj
LzB4YzAKWzQyMTc1Mi43NDUzNzBdwqAgPyBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKzB4MjgvMHg2
MApbNDIxNzUyLjc0NTM3NV3CoCBpZWVlODAyMTFfaWZhY2Vfd29yaysweDJmYy8weDQwMCBbbWFj
ODAyMTFdCls0MjE3NTIuNzQ1Mzk1XcKgIHByb2Nlc3Nfb25lX3dvcmsrMHgyMjcvMHg0NDAKWzQy
MTc1Mi43NDUzOThdwqAgd29ya2VyX3RocmVhZCsweDMxLzB4M2UwCls0MjE3NTIuNzQ1NDAwXcKg
ID8gcHJvY2Vzc19vbmVfd29yaysweDQ0MC8weDQ0MApbNDIxNzUyLjc0NTQwMl3CoCBrdGhyZWFk
KzB4ZmUvMHgxMzAKWzQyMTc1Mi43NDU0MDRdwqAgPyBrdGhyZWFkX2NvbXBsZXRlX2FuZF9leGl0
KzB4MjAvMHgyMApbNDIxNzUyLjc0NTQwN13CoCByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMApbNDIx
NzUyLjc0NTQxMl3CoCA8L1RBU0s+Cls0MjE3NTIuNzQ1NDEyXSAtLS1bIGVuZCB0cmFjZSAwMDAw
MDAwMDAwMDAwMDAwIF0tLS0KCi4uLgoKPiAgIAoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
