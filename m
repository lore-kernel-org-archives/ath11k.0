Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE27C04AA5
	for <ath11k@archiver.kernel.org>; Thu, 25 Aug 2022 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iku2lOUMNJPFF/idOOPZfUkRSGnv/mWtkqg2HnrXuwU=; b=g13D+bJN/xlOJx
	v8/6wdP115E9aCww1TGJX/wv9zlVMz13/rEJsuXNh18DsyHUaGnEA848FOPY0tGxMEzNVY+0FpWjI
	himYdUbKuSw6meDFY+DgJtLp4JxB7zb9tRGkQOM2Vgv8cwX3stiZ5s2HLLCm73eLxxPXX3TCGfPdE
	ii8VeiO4LALEeOAY6zsX6VJe4bJa0Li7QkdVNEsOPrkYIdZHnW0/AYcg5w8UrT+Z5i9lJdSAo+KhD
	Ka53KqgfX40PaSb92IlX3FEXM32iC+A3pLTpQHfIex8zAO6B/V3WD0FMTrBtCrniwZFoi2AYQijG3
	my1In5KWmYwdqAfzb/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAyK-00CYao-2y; Thu, 25 Aug 2022 11:24:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAyG-00CYa7-Qj
	for ath11k@lists.infradead.org; Thu, 25 Aug 2022 11:24:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PBLowr021146;
	Thu, 25 Aug 2022 11:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pi+aMBlUhuht5aU85NJRiDkjoL8S4J/RkhYoBtUSHoM=;
 b=lOIQ4I+kYGP+U3/M8VqTLMNOtwe4KyTzQush58ZBL4lG2IyzxzMjz6Q1g9OW7Yxa3ZdV
 EseeF5AqTQMUMq2kDAHqvwrpPOrZUAhzzHdx9wRBp3u5IN4nwAfovnPuwzkZoxThRcL2
 pW3Z+VTjB99COMoV9B4IXbV4Bt7iDjdCg/I4V1j4z4a5LqTuL1FIRsTY3Itz2AjCnjbv
 efy8UU9KmpfqG9smNKur2C0ZqRBr/xuj+/skobu8e1g2Azd/+aKdU9P52CV2s7EfEJaj
 aYLFa+3VKWF0dKC5N6F0dfhSAu/3MyB7UO2T88Off5YOQXb/GZkRq/Bl9tebTJ7kO59D 3Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j644nrssn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 11:24:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27PBOMiH022872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 11:24:22 GMT
Received: from [10.216.37.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 25 Aug
 2022 04:24:21 -0700
Message-ID: <ecce8764-1760-4617-49aa-c111305ebd55@quicinc.com>
Date: Thu, 25 Aug 2022 16:54:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/4] ath11k: Enable low power mode when WLAN is not active
Content-Language: en-US
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
 <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
 <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Dy4nT5NWopw63m2u0X81BNNhDmTg5shS
X-Proofpoint-GUID: Dy4nT5NWopw63m2u0X81BNNhDmTg5shS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_042424_911533_BF3DE219 
X-CRM114-Status: GOOD (  28.72  )
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

T24gNy8yMy8yMDIyIDU6MzkgUE0sIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToKPiBPbiA3LzIy
LzIwMjIgMTc6MDAsIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToKPj4gT24gNy8yMC8yMDIyIDA4
OjQ5LCBNYW5pa2FudGEgUHViYmlzZXR0eSB3cm90ZToKPj4+IEN1cnJlbnRseSwgV0xBTiBjaGlw
IGlzIHBvd2VyZWQgb25jZSBkdXJpbmcgZHJpdmVyIHByb2JlIGFuZCBpcyBrZXB0Cj4+PiBPTiAo
cG93ZXJlZCkgYWx3YXlzIGV2ZW4gd2hlbiBXTEFOIGlzIG5vdCBhY3RpdmU7IGtlZXBpbmcgdGhl
IGNoaXAKPj4+IHBvd2VyZWQgT04gYWxsIHRoZSB0aW1lIHdpbGwgY29uc3VtZSBleHRyYSBwb3dl
ciB3aGljaCBpcyBub3QKPj4+IGRlc2lyYWJsZSBvbiBhIGJhdHRlcnkgb3BlcmF0ZWQgZGV2aWNl
LiBTYW1lIGlzIHRoZSBjYXNlIHdpdGggbm9uLVdvVwo+Pj4gc3VzcGVuZCwgY2hpcCB3aWxsIG5v
dCBiZSBwdXQgaW50byBsb3cgcG93ZXIgbW9kZSB3aGVuIHRoZSBzeXN0ZW0gaXMKPj4+IHN1c3Bl
bmRlZCByZXN1bHRpbmcgaW4gaGlnaGVyIGJhdHRlcnkgZHJhaW4uCj4+Pgo+Pj4gU2VuZCBRTUkg
TU9ERSBPRkYgY29tbWFuZCB0byBmaXJtd2FyZSBkdXJpbmcgV2lGaSBPRkYgdG8gcHV0IGRldmlj
ZQo+Pj4gaW50byBsb3cgcG93ZXIgbW9kZS4KPj4+Cj4+PiBUZXN0ZWQtb246IFdDTjY3NTAgaHcx
LjAgQUhCIFdMQU4uTVNMLjEuMC4xLTAwODg3LVFDQU1TTFNXUExaLTEKPj4+Cj4+PiBNYW5pa2Fu
dGEgUHViYmlzZXR0eSAoNCk6Cj4+PiDCoMKgIGF0aDExazogRml4IGRvdWJsZSBmcmVlIGlzc3Vl
IGR1cmluZyBTUk5HIGRlaW5pdAo+Pj4gwqDCoCBhdGgxMWs6IE1vdmUgaGFyZHdhcmUgaW5pdGlh
bGl6YXRpb24gbG9naWMgdG8gc3RhcnQoKQo+Pj4gwqDCoCBhdGgxMWs6IEVuYWJsZSBsb3cgcG93
ZXIgbW9kZSB3aGVuIFdMQU4gaXMgbm90IGFjdGl2ZQo+Pj4gwqDCoCBhdGgxMWs6IEZpeCBmYWls
ZWQgdG8gcGFyc2UgcmVndWxhdG9yeSBldmVudCBwcmludAo+Pj4KPj4+IMKgIGRyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMWsvY29yZS5jIHwgMjM3ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0KPj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvY29yZS5oIHzCoMKgIDgg
Ky0KPj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvaGFsLmPCoCB8wqDCoCAx
ICsKPj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmPCoCB8wqAgMzMg
KystLQo+Pj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9yZWcuY8KgIHzCoMKg
IDIgKwo+Pj4gwqAgNSBmaWxlcyBjaGFuZ2VkLCAxODkgaW5zZXJ0aW9ucygrKSwgOTIgZGVsZXRp
b25zKC0pCj4+Pgo+Pgo+PiBUaGlzIHNlcmllcyBsb29rZWQgcG90ZW50aWFsbHkgcHJvbWlzaW5n
IHRvIG1lIGZvciBhIHByb2JsZW0gdGhhdCBJJ20gCj4+IHNlZWluZyBvbiBhIG5vdGVib29rIGZh
aWxpbmcgdG8gc2xlZXAgd2hlcmUgV0xBTl9XQUtFIGlzIGFzc2VydGVkIG9uIAo+PiB0aGUgV0NO
Njg1NSBvbiByZXN1bWUgZXZlbiB0aG91Z2ggV29XIHdhc24ndCBzZXQgYXQgYWxsLsKgIFRoaXMg
aXMgCj4+IHByb2JsZW1hdGljIGFzIGl0IGNhdXNlcyBhIHNwdXJpb3VzIHdha2Ugd2hpbGUgU1VU
IGlzIHJlYWRpbmcgZnJvbSB0aGUgCj4+IEVDIHNpbmNlIHR3byBJUlFzIGFyZSBub3cgYWN0aXZl
IGFuZCB0aGUga2VybmVsIHdha2VzIGZyb20gdGhhdC4KPj4gUmVtb3ZpbmcgdGhlIFdDTjY4NTUg
ZnJvbSB0aGUgc3lzdGVtIGl0IGRvZXNuJ3QgaGFwcGVuLgo+Pgo+PiBJIGZpZ3VyZWQgSSdkIGdp
dmUgaXQgYSBzcGluIHRvIHNlZSBpZiBpdCBpbXByb3ZlZCB0aGluZ3MuCj4+IEkgYXBwbGllZCB0
aGUgc2VyaWVzIG9uIHRvcCBvZiA1LjE5LXJjNyBhbmQgaXQgYXBwbGllZCBjbGVhbmx5IGJ1dCBJ
IAo+PiBnZXQgdGltZW91dHMgb24gd2xhbiBjYXJkIGluaXQgKGFuZCBvZiBjb3Vyc2Ugc3VzcGVu
ZCBmYWlscyBub3cgdG9vKS4KPj4KPj4gSGVyZSdzIHRoZSBtaGkvYXRoMTFrX3BjaSBzbmlwcGV0
czoKPj4KPj4gW8KgwqDCoCAyLjg2NDExMF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IEJBUiAw
OiBhc3NpZ25lZCBbbWVtIAo+PiAweGI0MDAwMDAwLTB4YjQxZmZmZmYgNjRiaXRdCj4+IFvCoMKg
wqAgMi44NjQ5MDFdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBNU0kgdmVjdG9yczogMzIKPj4g
W8KgwqDCoCAyLjg2NDkxMl0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IHdjbjY4NTUgaHcyLjEK
Pj4gW8KgwqDCoCAzLjEwNjg5Ml0gbWhpIG1oaTA6IFJlcXVlc3RlZCB0byBwb3dlciBPTgo+PiBb
wqDCoMKgIDMuMTA3MDU0XSBtaGkgbWhpMDogUG93ZXIgb24gc2V0dXAgc3VjY2Vzcwo+PiBbwqDC
oMKgIDMuMTk4MTc4XSBtaGkgbWhpMDogV2FpdCBmb3IgZGV2aWNlIHRvIGVudGVyIFNCTCBvciBN
aXNzaW9uIG1vZGUKPj4gW8KgwqDCoCAzLjk3MTAxOV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6
IGNoaXBfaWQgMHgyIGNoaXBfZmFtaWx5IDB4YiAKPj4gYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHg0
MDBjMDIxMAo+PiBbwqDCoMKgIDMuOTcxMDI1XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZndf
dmVyc2lvbiAweDExMDgwYmJiIAo+PiBmd19idWlsZF90aW1lc3RhbXAgMjAyMS0xMi0xNiAwMzo0
MiBmd19idWlsZF9pZCAKPj4gV0xBTi5IU1AuMS4xLTAzMDAzLVFDQUhTUFNXUExfVjFfVjJfU0lM
SUNPTlpfTElURS0yCj4+IFvCoMKgwqAgNC4yOTAzMjhdIGF0aDExa19wY2kgMDAwMDowMTowMC4w
IHdscDFzMDogcmVuYW1lZCBmcm9tIHdsYW4wCj4+IFvCoMKgwqAgNC4zMDg3NjBdIGF0aDExa19w
Y2kgMDAwMDowMTowMC4wOiBGYWlsZWQgdG8gc2V0IHRoZSByZXF1ZXN0ZWQgCj4+IENvdW50cnkg
cmVndWxhdG9yeSBzZXR0aW5nCj4+IFvCoMKgwqAgNC4zMDkwMjhdIGF0aDExa19wY2kgMDAwMDow
MTowMC4wOiBGYWlsZWQgdG8gc2V0IHRoZSByZXF1ZXN0ZWQgCj4+IENvdW50cnkgcmVndWxhdG9y
eSBzZXR0aW5nCj4+IFvCoMKgIDE0LjM4NjIwMV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IHFt
aSBmYWlsZWQgd2xhbiBpbmkgcmVxdWVzdCwgCj4+IGVyciA9IC0xMTAKPj4gW8KgwqAgMTQuMzg2
MjEwXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogcW1pIGZhaWxlZCB0byBzZW5kIHdsYW4gZncg
Cj4+IGluaTotMTEwCj4+IFvCoMKgIDE0LjM4NjIxNF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6
IGZhaWxlZCB0byBzZW5kIGZpcm13YXJlIHN0YXJ0OiAKPj4gLTExMAo+PiBbwqDCoCAxNC4zODYy
NDNdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gc3RhcnQgZmlybXdhcmU6IC0x
MTAKPj4gW8KgwqAgMTQuMzg2MjY2XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRv
IHNldHVwIGRldmljZTogLTExMAo+PiBbwqDCoCAxNC4zODYzMDBdIGF0aDExa19wY2kgMDAwMDow
MTowMC4wOiBmYWlsZWQgdG8gc3RhcnQgZGV2aWNlIDogLTExMAo+Pgo+PiBBbmQgc28gLSBvbi4K
Pj4gSXMgaXQgZnVuY3Rpb25hbGx5IGRlcGVuZGVudCBvbiBvdGhlciBwYXRjaGVzIGluIGxpbnV4
LW5leHQgb3IgYW5vdGhlciAKPj4gdHJlZSBJIHdvbid0IHNlZSBpbiA1LjE5Pwo+IAo+IEkgaGFk
IGEgdHJ5IHdpdGggbGludXgtbmV4dCBhbmQgeW91ciBzZXJpZXMgYnV0IEkgcmVwcm9kdWNlIHRo
ZSBzYW1lIAo+IGZhaWx1cmUgSSBkZXNjcmliZWQgYWJvdmUuCj4gCj4gZWUzYTA2NmU0ZjRlIChI
RUFEKSBhdGgxMWs6IEZpeCBmYWlsZWQgdG8gcGFyc2UgcmVndWxhdG9yeSBldmVudCBwcmludAo+
IDRmODUwZjFlMjZkYyBhdGgxMWs6IEVuYWJsZSBsb3cgcG93ZXIgbW9kZSB3aGVuIFdMQU4gaXMg
bm90IGFjdGl2ZQo+IGUzMjBjOGVmOTg0MSBhdGgxMWs6IE1vdmUgaGFyZHdhcmUgaW5pdGlhbGl6
YXRpb24gbG9naWMgdG8gc3RhcnQoKQo+IGRiYzI2MDM2YzFlZiBhdGgxMWs6IEZpeCBkb3VibGUg
ZnJlZSBpc3N1ZSBkdXJpbmcgU1JORyBkZWluaXQKPiAxOGMxMDdhMWYxMjAgKHRhZzogbmV4dC0y
MDIyMDcyMiwgbGludXgtbmV4dC9tYXN0ZXIpIEFkZCBsaW51eC1uZXh0IAo+IHNwZWNpZmljIGZp
bGVzIGZvciAyMDIyMDcyMgo+IAo+IAoKU29ycnkgZm9yIGxhdGUgcmVwbHkgYW5kIHRoYW5rcyBm
b3IgcmVwb3J0aW5nIHRoZSBidWcuCkFmdGVyIHNldmVyYWwgcm91bmRzIG9mIGRpc2N1c3Npb25z
IHdpdGggdGhlIGNvbmNlcm5lZCB0ZWFtcyBvbiB0aGUgCmZhaWx1cmUgdGhhdCB5b3UgaGF2ZSBy
ZXBvcnRlZCwgd2UgaGF2ZSByb290IGNhdXNlZCB0aGUgaXNzdWUuCgpUaGUgY2hhbmdlcyB0aGF0
IEkgaGF2ZSBwb3N0ZWQgd2lsbCBub3Qgd29yayBvbiBvdGhlciB0YXJnZXRzIGxpa2UgCldDTjY4
NTUgYXMgaXMuIEl0IHJlcXVpcmVzIGFkZGl0aW9uYWwgY2hhbmdlcyBhbmQgdGhlcmVmb3JlIGxv
dHMgb2YgdGVzdGluZy4KCkZvciBub3csIEkgaGF2ZSBwb3N0ZWQgYSBWMiBlbmFibGluZyB0aGUg
ImxvdyBwb3dlciBtb2RlIiBkZXNpZ24gb25seSBvbgpXQ042NzUwLiBJIGhhdmUgc3RhcnRlZCB3
b3JraW5nIG9uIGVuYWJsaW5nIHRoZSBsb2dpYyBmb3Igb3RoZXIgY2hpcHNldHMgCmFsc28uIE9u
Y2UgdGhlIGNoYW5nZXMgYXJlIHdlbGwgdGVzdGVkLCBJJ2xsIHBvc3QgYSBzZXBhcmF0ZSBwYXRj
aCB0byAKZW5hYmxlIGl0IG9uIFdDTjY4NTUuIEl0IG1pZ2h0IHRha2UgYSBsaXR0bGUgbW9yZSB0
aW1lLgoKVGhhbmtzLApNYW5pa2FudGEKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTFrCg==
