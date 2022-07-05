Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A24C433EF
	for <ath11k@archiver.kernel.org>; Tue,  5 Jul 2022 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75xxYfFB6yLsBtYzVBUwW8pFP1gmQ9fisiBcxqOZAqU=; b=ZLlboCiDGpHaGC
	m5onlnrf03N3X0x064ZzgdjfeJPboBLUKG8A0Fa8uoGeiFnu9FEOLxQElNlzb1+zGh3FLiUiHl8C2
	f7WbaV1JlImrNxGXxZhEvBXz9lKUm/Q4pVr3YvUNRqyHaqlGNRUL/Vg3FAJN6b+kFSzjW5OeG/xyR
	Tvuk6tHNHbJkdjt6dwDGuyRGw2DOytm8y1R0ytFsy4oUvbVhuQbNZBDphg1IlIlqrcAsxkcRMCOie
	3sffDitHFVLSl8oA2Ug3vp1WRqZxlp9Q0kK+jCKSr++i5OJ8dM5qTvkvhOUELaUQjPourcRAghFnq
	6AoyL/NKTIJliyczPDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8djr-00G6x8-Bp; Tue, 05 Jul 2022 08:16:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8djo-00G6vZ-5K
	for ath11k@lists.infradead.org; Tue, 05 Jul 2022 08:16:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2658BOb8014901;
	Tue, 5 Jul 2022 08:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=ZVNkqvy32WJ1+AKkfZHF64Zm9C1DkjAppZX4t0ue1PQ=;
 b=MQXUAUkh9+s+4/39++RM7GsqwFNs44ComndzGlTIfpz2+w7S5WoHDy0DWoX+bjiN4E5a
 p4STAYVb84rXzzfxbYEAryiBYme8Yw1UGw9pC7A98bU4cikpt2ecDRY8i9VjlRs4gJEZ
 O3V9vbrm88Cn7sT5i5ktgutFWRwiTDEQlqRn8ZgGiS8URnRS9cytJm1yfDMTw86aHcNj
 CuZE9FmAihg+geAwRX5wG6Lu0NNdIT3nQrcmc4ujKog/XXfrhuNBhR98Ci5wBF3aVYuJ
 abrgc6UKAuTM7596ETaCUdpEs1+bCNLoAIUY9GPnFhM7v5K9unLHWpI3KRNJ8b9kvGZK cQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3h2e419k56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Jul 2022 08:16:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcya5iObAzp4voAN72xeAblGcUtP+k6b74JnDMI5kEZtCcfJh5SzFOv7ZOOIU8BQCgpik64Zin8i4kBW3fKQkdvACEw+ieXUXpZKucAucoXtq+Iel3K7dqh4aP8Ii+Ajres8G20rqViU1toLpN7q5xokzECFxnQ8lw8cYbVuH5uOgb60K9Q9oCMd5KXN56xgGMf76mxFbVNdqYJxoUv1OxSoVEu/z1slKqxnfl9M7LUGDSYjEuMMQE4NnwCvntCvjrs8iB/yShggjrtRY9AHKWGchqzo01sY9NG/5B0eUD240vS+xa4uJ573J1hKtXrPn6hvYKSiQ08OQIZd6PGNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVNkqvy32WJ1+AKkfZHF64Zm9C1DkjAppZX4t0ue1PQ=;
 b=FDoldPlwroGhJ68tmm55LgwplFDtg0ERT7O4rshdk6E5AQKgPYg4XEPmqTb59b4iPkFzli3esozg4JEB1s6B7HqNG+tYNCgGJvqFC6D7jIx5xMyEW/jH/23o0DxOdRR5o9Cl5m1YgIs+QmPsQBlKrU2yZs96S/kcqD8T9shea9DqPwScJ0X4BlUeDy5Ac3IMVKzoTZuPXxclvE/clKHmnTY4TDLJeeFDWglI2KvnrK01fPrY6QTIGVuC1b/eqLxLYPvisJyS0Mabxyn858ddvnaXD8wwdahNNq2BMLNMfgUu2vLZ9fT2RKIes6oC6W8CtqiOq2t6MPGMIYlmvBN92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SJ0PR02MB8784.namprd02.prod.outlook.com (2603:10b6:a03:3d7::18)
 by MWHPR02MB2319.namprd02.prod.outlook.com (2603:10b6:300:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 08:16:46 +0000
Received: from SJ0PR02MB8784.namprd02.prod.outlook.com
 ([fe80::b0ee:a9bb:7eae:59e]) by SJ0PR02MB8784.namprd02.prod.outlook.com
 ([fe80::b0ee:a9bb:7eae:59e%5]) with mapi id 15.20.5395.022; Tue, 5 Jul 2022
 08:16:46 +0000
From: "Govindaraj Saminathan (QUIC)" <quic_gsaminat@quicinc.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        Thomas Duffy
	<ted4q@virginia.edu>,
        "Saravanan Jaganathan (QUIC)"
	<quic_sjaganat@quicinc.com>,
        "Sricharan Ramabadhran (QUIC)"
	<quic_srichara@quicinc.com>
Subject: RE: QCN9074 mhi Issues
Thread-Topic: QCN9074 mhi Issues
Thread-Index: AQHYghxlU4eMMrGjW0690GJtdWPUY61Yl9kAgBbx7fA=
Date: Tue, 5 Jul 2022 08:16:46 +0000
Message-ID:  <SJ0PR02MB8784DC7831BC6CAA47A9F080F8819@SJ0PR02MB8784.namprd02.prod.outlook.com>
References:  <CA+2MDz=T79jdpug_-PkOftNGbhr3xq=sPJU8go=03t0_kZYG7w@mail.gmail.com>
 <1f4152a1-7ec4-baff-1abb-7e9990d66c16@quicinc.com>
In-Reply-To: <1f4152a1-7ec4-baff-1abb-7e9990d66c16@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be947940-ea7b-444c-fdf7-08da5e5eb3e9
x-ms-traffictypediagnostic: MWHPR02MB2319:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Q57AHofktAzG76QhqhuJ1kNsTmki1SWYtbDnzTzHrM3q35OGl5RhVcOD8KWnN/h5JEPc1PMFPUz68NjXivY61tcqonNURWocbV1du4Su0kTotsAE9Lo6V48bG0Z1jD8fUuQtsEwUKLZW/Zm21ykyZ1DdguvtF3m3/C+RZLWzbavXZSQblpfxH3L8YkCoPSitw//RFGfmVeJVJzcTaiXWS2+iGF0P9iot5ZR+abFAAabcwd4B7wCJyNkF6zK4qNNxLvVOkH3kem8FA+i0yZ2wUuHyXQBGB5ELahhU4GAhtAFluEfG/xKs2SYr/gNKpA81cmJX1f6UhxGjsXcgfajagCRocGf1ZW94c2p15HPb9rd0c5583uOAFqooWYfsx6qnee/sZnBBOrdNjFU9MnkikDYMr8gfnBwQCRJgghBemM235fkpcd/j6xP/QohLm+zJ76PsslbcRjsjAJWbhouhH8U9diqnijj1QedmqwZmcqB8Nix9VuCGJV8WxX/mlxwijOGUQ2wz4sTsYBYCOtOdO83cekVTfoM+8ISHC96s38qGa6IgfcBWXYjM2lnvMHDRT8nS+EybsrRskoPj1zrtTLkMrne3v3gKmZ76gWNsVLiI+5TiGaT46c9Oc9EmIXRVrwYjrULf2pebl3ivzqprlcoJWYFvtfCl75DSLgOevsQIxISpX3heVGpgHnQNVXYGALMjAup05D5plCgQXwrB2hhnaBzc5mnVFzDVWfTIfeYMyYr1qaXE0CfnX35lh3wdptsl/X77uUqUkmUGpHVxO6VR5G0eOD4v9L4+6AxBmCaO16kSgf4oll5JliCVt/RhNmr/WPNo8qlEyjgGH9Tx2J9ka89kHDAgO3GmnC4oovyJNdoKHjRS27WhckqWQ6GY
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8784.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(6506007)(186003)(7696005)(26005)(9686003)(2906002)(38100700002)(5660300002)(33656002)(110136005)(7116003)(66946007)(478600001)(38070700005)(8676002)(66556008)(76116006)(6636002)(66446008)(66476007)(64756008)(316002)(966005)(122000001)(55016003)(52536014)(41300700001)(83380400001)(8936002)(71200400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TlhQamYyN1dja1pjZldMd1U2MzVic2pWQThoSWM4Vzk2U3RyZTh0eEVqNm9M?=
 =?utf-8?B?cFpycGJhMm9ZaUJJNldES1N6S2c5VDdIQXZETENKT2V2WklQNGJZMVcwVE9s?=
 =?utf-8?B?dTNTYTN0Tnl6QXlFaDJwREdDNDRFUW4wRGpDOXd5NndRby80bk15RkgxNEZH?=
 =?utf-8?B?ZWJZc3ZPaHljdXRoT3V4V0dsNnhSQ21PRFY0eEIxdmtpK1l4ZVRpNWVudlhu?=
 =?utf-8?B?cmxTUm9SVnBhN0VFMXZSbjBXaDJaVGppb25HSVM4cThLKzNFZEpMelY4Qnc3?=
 =?utf-8?B?QU5MajNnY05JNE1GeEVISjZySk5PSmpHSmN1akxQM0R2M0d0WVlTd2J6bTQ1?=
 =?utf-8?B?RitsTExDdDFrYXV6Q3dQaXdnYzNwRHFoNzExelpQUkxuOUR5NzU5aUhUNEds?=
 =?utf-8?B?V0Y2VVB3QnBlcnBEM0dGbmRsTUJnYzB6Yjh2VzdtTHZXdlhNV1M3ZzNaTEFD?=
 =?utf-8?B?dU1CZ0U1VndUWmNIb3RRMTVVUkYvZDcrZjRsL1IrYjNWTFJ1ZGwxeE9SMDNm?=
 =?utf-8?B?QU9MNFBBOFBIaUhYd2JFVEhTOHVCWVZ3bTV4OEhObVFDdVFEUGRSRkdTd3NI?=
 =?utf-8?B?MUtLZHFtMlp5bHFZOUtxcjIrb2J6UG5JaSs3R1FIYjVIcStKKzlqL2YzZ0d4?=
 =?utf-8?B?YzF2SkVzZTRLTVcycGRZaFBpNzBIQjFqWXI4eUEyR09yWFZBUmFVbmNlclNu?=
 =?utf-8?B?UytMRy9HdmgwZlZqZ0U1eFM2RHdGcVpsRHVpd2tVNTVzVVhmL2FCSVNsa3JV?=
 =?utf-8?B?OEZhVm9jbWZHMnFLUE11UWp5YWMzOGxXRUZBZFdVZHJhS0ZUK21HaE41RGhm?=
 =?utf-8?B?RkJUTDc4djZXaWFQMElUTkxhNjluUGZrS2hTZUNXUEZuZDlpVkMvKzlMd1R3?=
 =?utf-8?B?Tkl6YXl4MHJDekdyRFBQZy9qVlRUdjdjQWk1ak9CR1BvKzRkQ1hwQ2pGdTBK?=
 =?utf-8?B?OUV3K2pwWDJ0TThqUTJDUHY1ZUZINVgyd3BTOFNTMnZISi9Ib2tINklMaTBU?=
 =?utf-8?B?SnZxTkZpMi8zYjVZTTJKK0sxeW44L0JvQSs5WU04YmRxcmR2VXBNZ25ZdUVY?=
 =?utf-8?B?eVhnU2RGMVpYL1g0bHhSU0FYVzk1VS9xY1kwajREYlJ2bWw2TDgyZ1NNMW5n?=
 =?utf-8?B?dEgzUFNJRnpVSHMyTTQxcS9XVUhjcC93c3RYajZ5VTVoenNMV29kaVl5OW5a?=
 =?utf-8?B?UEJ6MTBkRkNncTFwaDBncmRrUEo2ZzR2WjB1bG9VQWRaMGN5a21sV2U1WUhL?=
 =?utf-8?B?cFlMMmN1ejdPWTUxQVVyUVRuUnprTDlXVk01ZnNsSk45bGlrbEVhVVFWRjd4?=
 =?utf-8?B?NkpsV1JJYzB2Qmtpc0ZhU0xEM3FCNkRIbG51ZHpSRDlOZVgvcGJOWm4wRmty?=
 =?utf-8?B?dXpmSjMvazNjcWV4RXJxVE5PRlpoa1hIWE8rWEZqMk5rcHkvQ0RpUHh3TFlY?=
 =?utf-8?B?cmlMREdGMGRXUVFBMzR4WWY3bWM0NFpGeDc0T3o2YkdZdGhBbW9CMVNNTG5E?=
 =?utf-8?B?SHBVaE5HRGF4SzBQbG85bzU0VFpuSi9kRVpSZ1c0VVFPZEpwV2hNcEplT1Ur?=
 =?utf-8?B?OXlFOElEd01Qdy9HVExENVFnZFA5YURrdyt6Z2VGbDd5OVVEL1RWaldzZzNu?=
 =?utf-8?B?S1loLzFpWVZhSEhOc09memwzSXFqbFJqMTlwNWNwNXZsYld3Z0Y0c2lTTkpE?=
 =?utf-8?B?V1JrdFFoeTl3U283RHBQRHM4T1FESjJYbGdnaHVLV0YyQkxxbUNLMmxnOFp2?=
 =?utf-8?B?bTlNN3dYdTRISmRqWmFvZEtpS3RRU2ZTVVJsRTBudHdCUGFQYm5oc0tNdjEx?=
 =?utf-8?B?WHBCSGdvSlZPVzRCUm83aGxpOGxwbU1VSmRmN0VZTVhyVTRNSTJkRXNiNFB4?=
 =?utf-8?B?MEFIL0FvWStQSXFiZ1VDZk14d2F5OEVMZnE5OWVkTlBnSC9jQkNwcy9UQWVW?=
 =?utf-8?B?bERzY2NTL2xKWjd0elVyT1VOVDRYWG5Bd3VqM0diM0loOFRWd1VVNFVwM0xa?=
 =?utf-8?B?aW0rYytaMXFLRUN5MVlIOU1MZE1QWW9FWFVVM0xuTEF0Z2M5MklzMWdMeno2?=
 =?utf-8?B?QUI5NWw1WUROQmxENllXb0RWMWQxUU5FNXdKQmVSY0JPQVNkbUs5SW9pcjRG?=
 =?utf-8?Q?8y0tpcNfMT9Yc4/cQPrVDzC/a?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8784.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be947940-ea7b-444c-fdf7-08da5e5eb3e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 08:16:46.4427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJaHRUo0nRlV67SUSd/z83uAMogD0B/7lOETufnxrBcL+VogjYp4WEdTp/Av3ay5MhY5Zph4ya5HkUIIxN9Izhd37CyZ71jWqjOEo/cJ1sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2319
X-Proofpoint-GUID: A12etA5CjnuumO1ciwuAKPUgcBk9_crQ
X-Proofpoint-ORIG-GUID: A12etA5CjnuumO1ciwuAKPUgcBk9_crQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_06,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_011652_359186_0399EE56 
X-CRM114-Status: GOOD (  17.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Thomas Duffy,

From the below logs, it looks the ELF header is bad, so PBL rejected it.

Can you please confirm,
	1. md5sum of the amss.bin in board and the one in website is same?
	2. In function mhi_fw_load_bhi, print the below details
	upper_32_bits(dma_addr)
                lower_32_bits(dma_addr)
                size & session_id

Regards,
Govindaraj S.

-----Original Message-----
Subject: QCN9074 mhi Issues
Date: Fri, 17 Jun 2022 03:20:09 -0400
From: Thomas Duffy <ted4q@virginia.edu>
To: ath11k@lists.infradead.org

I had been waiting for the ath11k driver and QCN9074 firmware to mature, and it appears that this is the case, as the driver is now in mainline kernel and the firmware is in linux-kernel.

However, my setup just doesn't work, and I am hoping for some help troubleshooting.

I have a supermicro X10SDV-4C+-TLN4F board which has a Xeon D-1518 processor that is paired with a Compex WLE3000H2 Wifi 6 5Ghz card.
Vt-d is enabled in BIOS.

I am running Ubuntu 22.04 Server which has kernel 5.15 and thus has the driver.

I have board-2.bin, amss.bin, and m3.bin all in the correct folder
(lib/firmware/ath11k/QCN9074/hw1.0) from
https://github.com/kvalo/ath11k-firmware/tree/master/QCN9074/hw1.0

lspci output shows the card:

06:00.0 Network controller: Qualcomm Device 1104 (rev 01)

The ath11k_pci driver finds and enables the device:

[    9.344266] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem
0xfb200000-0xfb3fffff 64bit]
[    9.344294] ath11k_pci 0000:06:00.0: enabling device (0100 -> 0102)
[    9.369190] ath11k_pci 0000:06:00.0: qcn9074 hw1.0

But then fails to start the device with mhi errors:

[    9.494081] ath11k_pci 0000:06:00.0: failed to set mhi state: POWER_ON(2)
[    9.494087] ath11k_pci 0000:06:00.0: failed to start mhi: -110
[    9.494094] ath11k_pci 0000:06:00.0: failed to power up :-110
[    9.588331] ath11k_pci 0000:06:00.0: failed to create soc core: -110
[    9.592083] ath11k_pci 0000:06:00.0: failed to init core: -110
[   10.339939] ath11k_pci: probe of 0000:06:00.0 failed with error -110

The dmesg output for mhi is:

[    9.456834] mhi mhi0: Requested to power ON
[    9.457281] mhi mhi0: Power on setup success
[    9.472444] mhi mhi0: Image transfer failed
[    9.475709] mhi mhi0: Reg: ERROR_CODE value: 0xef128100
[    9.479172] mhi mhi0: Reg: ERROR_DBG1 value: 0xfffa0000
[    9.482722] mhi mhi0: Reg: ERROR_DBG2 value: 0x0
[    9.482727] mhi mhi0: Reg: ERROR_DBG3 value: 0x1ef13
[    9.482744] mhi mhi0: MHI did not load image over BHI, ret: -5

Does anyone have any suggestions?

Thanks,

TD

--
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
