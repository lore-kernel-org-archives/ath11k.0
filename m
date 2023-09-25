Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD9CCE7A91
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uy8wvZEdAe88BnBY91SZiNnMEdO/fbzAXUFwbYHSfkU=; b=bIK/OJU9mT9jGS
	7Hj5mlTFV0YmVwJUhMBwqTNPy2V+23nQAuBTkfaX0p59bPIMve6cQk4s1Vs1cHRIQO8pbUntX+rPd
	trUSgP4wEMwhh7Pj4WsFFZK5xGHUbolbXqwfux9M0o2BYKnFhDXfnkVd1F1Elbib8fakt9xVi+JxR
	aXaAx0Chr1OLiGstTk39UfHUruoWHwx5uAVSHUoB8b+Fr3vCfAvTxYUaslVbJeDQdS8KaqrA2sXkw
	sRrpYW+tebmnOXqb5ryZwMAW3HVu8dKf0b3mW5U1WCYGjCxZkKsgchZ1jpRqG85Rz2GsTFHNXN00x
	ruJzxSwAtmnqmxrAgiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkb8m-00D9FZ-1O;
	Mon, 25 Sep 2023 02:16:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkb8j-00D9Eq-0c
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 02:16:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P2EGUB003550;
	Mon, 25 Sep 2023 02:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EIUxD9SZcufmEDOSneOgGCFeMWo6xO3+8PnvzM8rsdY=;
 b=eXZ+Tdnc791kqSdKn8ZB8c5A56QQPVdb2re35zDogKeiInwKFThIyZzE/utgp0euaN/V
 P2yv73H/0q+EDkfmluVZoqfVt4ZH8Ij4LLOocrfWp072IcFsVHxgmvMRzxZgwQDi9TDf
 rZiLU1wGYdI1gtQTYjHk+wVNBVahBR1AOWXs587+KgErTU/vbGFAYSHJV/OECkbCcsEH
 IUpzmFCQSwI4Rvz0vkrJpSlX0gVxtI/Wl1wwiI8JzRN8wl9+AeUZY+Iymvkg6Y0hM+M/
 KzeTedsyXtWoaevdFHtOu+MaZ+mtmgrfLkz4ufoStSmsG+WZJCTnRlCGT+Wto9Hmt14+ bQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tajapgwst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 02:15:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38P2Fm9s006759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 02:15:48 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Sun, 24 Sep
 2023 19:15:46 -0700
Message-ID: <145e9534-6610-9c11-b2b9-87fb8e50ef81@quicinc.com>
Date: Mon, 25 Sep 2023 10:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6
 GHz station
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-14-quic_wgong@quicinc.com>
 <eb08e0f2-c932-4d79-b2ee-813c2999d1a5@quicinc.com>
 <fbad2af6-9c3f-c241-b820-7820b4200bf4@quicinc.com>
 <60aaa1fc-99cf-476c-af51-e5ad425792f9@quicinc.com>
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <60aaa1fc-99cf-476c-af51-e5ad425792f9@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iqi3JornSTpE9WFtoQvfefM_oX1yCIZ1
X-Proofpoint-GUID: iqi3JornSTpE9WFtoQvfefM_oX1yCIZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-24_21,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_191601_384615_CD3B237C 
X-CRM114-Status: GOOD (  21.84  )
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

T24gOS8yMi8yMDIzIDk6MjUgUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA5LzIy
LzIzIDE1OjQyLCBXZW4gR29uZyB3cm90ZToKPj4gT24gOS8yMi8yMDIzIDU6MjQgUE0sIEFkaXR5
YSBLdW1hciBTaW5naCB3cm90ZToKPj4+IE9uIDkvMjAvMjMgMTM6NTMsIFdlbiBHb25nIHdyb3Rl
Ogo+Pj4+IFdoZW4gc3RhdGlvbiBpcyBjb25uZWN0ZWQgdG8gYSA2IEdIeiBBUCwgaXQgaGFzIDIg
d2F5IHRvIGNvbmZpZ3VyZQo+Pj4+IHRoZSBwb3dlciBsaW1pdCB0byBmaXJtd2FyZS4gVGhlIGZp
cnN0IHdheSBpcyB0byBzZW5kIDIgd21pIGNvbW1hbmQKPj4+PiBXTUlfUERFVl9QQVJBTV9UWFBP
V0VSX0xJTUlUMkcvV01JX1BERVZfUEFSQU1fVFhQT1dFUl9MSU1JVDVHIHRvCj4+Pj4gZmlybXdh
cmUsIHRoZSBzZWNvbmQgd2F5IGlzIHRvIHNlbmQgV01JX1ZERVZfU0VUX1RQQ19QT1dFUl9DTURJ
RCB0bwo+Pj4+IGZpcm13YXJlIHdoaWNoIGluY2x1ZGUgbW9yZSBwYXJhbWV0ZXJzIGZvciBwb3dl
ciBjb250cm9sLgo+Pj4+Cj4+Pj4gVGhlIGZpcnN0IHdheSBpcyBkaXNhYmxlZCBpbiBwcmV2aW91
cyBwYXRjaAo+Pj4+ICJhdGgxMWs6IGRpc2NhcmQgQlNTX0NIQU5HRURfVFhQT1dFUiB3aGVuIEVY
VF9UUENfUkVHX1NVUFBPUlQgZm9yIDYgCj4+Pj4gR0h6Ii4KPj4+Pgo+Pj4+IFByZXBhcmUgdGhl
IHBhcmFtZXRlciBmb3Igd21pIGNvbW1hbmQgV01JX1ZERVZfU0VUX1RQQ19QT1dFUl9DTURJRCBh
bmQKPj4+PiBzZW5kIHRoZSBmaXJtd2FyZSBhZnRlciB2ZGV2IHN0YXJ0IHJlc3BvbnNlIHN1Y2Nl
c3MgZnJvbSBmaXJtd2FyZSwgaXQKPj4+PiBpcyBmb3IgdGhlIHNlY29uZCB3YXkgb2YgcG93ZXIg
Y29udHJvbC4KPj4+Pgo+Pj4+IFRlc3RlZC1vbjogV0NONjg1NSBodzIuMCBQQ0kgCj4+Pj4gV0xB
Ti5IU1AuMS4xLTAzMTI1LVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0zLjY1MTAuMjMK
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlbiBHb25nIDxxdWljX3dnb25nQHF1aWNpbmMuY29t
Pgo+Pj4+IC0tLQo+Pj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMg
fCA4ICsrKysrKystCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMWsvbWFjLmMgCj4+Pj4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21h
Yy5jCj4+Pj4gaW5kZXggYThhZTI4MWQyNjM1Li5mOGI5MDdhNzU4YjEgMTAwNjQ0Cj4+Pj4gLS0t
IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKPj4+PiBAQCAtNzI5Niw2ICs3Mjk2LDEy
IEBAIGF0aDExa19tYWNfdmRldl9zdGFydF9yZXN0YXJ0KHN0cnVjdCAKPj4+PiBhdGgxMWtfdmlm
ICphcnZpZiwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+PiDCoMKgwqDC
oMKgIH0KPj4+PiDCoCArwqDCoMKgIGlmIChhdGgxMWtfbWFjX3N1cHBvcnRzX3N0YXRpb25fdHBj
KGFyLCBhcnZpZiwgY2hhbmRlZikpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgYXRoMTFrX21hY19m
aWxsX3JlZ190cGNfaW5mbyhhciwgYXJ2aWYtPnZpZiwgCj4+Pj4gJmFydmlmLT5jaGFuY3R4KTsK
Pj4+IFNvIHdlIGFyZSBwYXNzaW5nIGxvY2FsIGNvcHkgb2YgY2hhbm5lbCBjb250ZXh0IHN0b3Jl
ZCBpbiAKPj4+IGFydmlmLT5jaGFuY3R4LiBEbyB3ZSBuZWVkIHRvIHVwZGF0ZSBpdCB3aGVuIGNo
YW5uZWwgY2hhbmdlcz8KPj4+Cj4+PiBJIHNlZSB0aGF0IGR1cmluZyBhc3NpZ25tZW50IHRpbWUs
IHdlIGFyZSBjb3B5aW5nL3VwZGF0aW5nIGl0IGFuZCAKPj4+IGFjY29yZGluZ2x5IHRoZSBjb21t
YW5kIHdpbGwgYmUgc2VudCB0byBmaXJtd2FyZSwgYnV0IHdoYXQgYWJvdXQgCj4+PiB3aGVuIFNU
QSBtb3ZlcyBjaGFubmVsPyBhcnZpZi0+Y2hhbmN0eCBzaG91bGQgYmUgdXBkYXRlZCBhbmQgdHBj
IAo+Pj4gY29tbWFuZCBzaG91bGQgYmUgc2VudCBhZ2FpbiBpbiB0aGF0IGNhc2U/Cj4+Cj4+IFRo
aXMgaGFzIGJlZW4gZGlzY3Vzc2VkIGJlZm9yZSBoZXJlIHBlciBxdWVzdGlvbiBvZiBKb2hhbm5l
czoiQ291bGQgCj4+IHRoaXMgaW5mb3JtYXRpb24gY2hhbmdlPyBTaG91bGQgd2UgdHJhY2sgaXQg
aW4gYmVhY29ucz8iOgo+Pgo+PiBbUEFUQ0ggOS85XSBtYWM4MDIxMTogc2F2ZSB0cmFuc21pdCBw
b3dlciBlbnZlbG9wZSBlbGVtZW50IGFuZCBwb3dlciAKPj4gY29uc3RyYWludAo+Pgo+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy8zOGU3ZDlkMmVlYmFmYTcyNDVhMzZh
MGEwMzk2MDk0NTI2ZWIzZWZkLmNhbWVsQHNpcHNvbHV0aW9ucy5uZXQvIAo+Pgo+IFRoYXQncyBm
aW5lLiBUaGF0J3Mgdy5yLnQgdG8gVFggcG93ZXIgY2hhbmdlLiBJJ20gc2F5aW5nIGhlcmUgYWJv
dXQgCj4gQ1NBPyBXaGF0IHdoZW4gQVAgdHJpZXMgdG8gc3dpdGNoIGNoYW5uZWw/IEZvciB0aGF0
IGNsaWVudCBuZWVkIG5vdCAKPiBkaXNhc3NvY2lhdGUgYW5kIGFzc29jaWF0ZSBiYWNrIHJpZ2h0
Pwo+Cj4gSW4gdGhhdCBjYXNlLCBjaGFubmVsIGNvbnRleHQgaW4gbWFjODAyMTEgbGF5ZXIgd2ls
bCBjaGFuZ2UuIEJ1dCBvdXIgCj4gZHJpdmVyJ3MgYXJ2aWYtPmNoYW5jdHggd2lsbCBoYXZlIHBy
ZXZpb3VzIG9uZSBvbmx5LiBXZSBhcmUgdXNpbmcgCj4gY2hhbm5lbCBjb250ZXh0IHRvIGdldCB0
aGUgaWVlZTgwMjExX2NoYW5uZWwgd2hpY2ggaGFzIHRoZSBQU0QgdmFsdWUsIAo+IGFuZCB0aGF0
IHZhbHVlIHdlIGFyZSBzZW5kaW5nIHRvIGZpcm13YXJlIHZpYSBUUEMgY29tbWFuZCBkdXJpbmcg
Cj4gaW50aWFsIGFzc29jaWF0aW9uIHRpbWUuIFNvIHdoZW4gY2hhbm5lbCBjaGFuZ2VzLCBmaXJt
d2FyZSBhbHNvIHNob3VsZCAKPiBiZSB1cGRhdGVkIHdpdGggdGhlIGxhdGVzdCBQU0QgdmFsdWVz
IHZpYSBUUEMgY29tbWFuZCBmb3IgdGhlIGxhdGVzdCAKPiBjaGFubmVsIHJpZ2h0Pwo+CllvdSBh
cmUgcmlnaHQuIENTQSBtYXkgYmUgY2hhbmdlIGNoYW5uZWwgYmFuZHdpZHRoLgoKQ3VycmVudGx5
IHdlIGNvdWxkIGtlZXAgTk9UIHN1cHBvcnQgQ1NBIGFzIHdlbGwgYXMgQ1NBIGZvciBNTE8gc2lu
Y2UgCnRoZXNlIGFyZSB0aGUgYmFzaWMgVFBDIHN1cHBvcnQgZmVhdHVyZS4KCldlIGNvdWxkIG1h
a2UgbmV3IHBhdGNoIGxhdGVyIHRvIHN1cHBvcnQgQ1NBIGZybyBUUEMgcG93ZXIsIE9LPwoKPgo+
CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
