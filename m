Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
 <2335594.cnkAv9Vaq7@bentobox> <1845755.pTfhzBy2qg@bentobox>
From: Markus Theil <markus.theil@tu-ilmenau.de>
Message-ID: <46ab4ffd-b512-de43-40bb-f35989d228b9@tu-ilmenau.de>
Date: Tue, 5 May 2020 17:37:27 +0200
MIME-Version: 1.0
In-Reply-To: <1845755.pTfhzBy2qg@bentobox>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@narfation.org>, ath11k@lists.infradead.org
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>, kvalo@codeaurora.org

On 5/5/20 9:49 AM, Sven Eckelmann wrote:
> On Tuesday, 5 May 2020 09:01:34 CEST Sven Eckelmann wrote:
>> On Tuesday, 5 May 2020 01:46:12 CEST Rajkumar Manoharan wrote:
>> [...]
>>> IIRC this was fixed a while ago by below patch. Somehow it never landed =

>>> in ath.git.
>>> Simple one line change is enough.
>>>
>>> https://patchwork.kernel.org/patch/10550707/
>> Because it doesn't work for everything. Remember that 10.2.4.x overflows=
 all =

>> the time (14-30s) because it used only 31 bit for the counters.
>>
>> But feel free to point me to the firmware version which fixed this.
> See also https://patchwork.kernel.org/patch/9701459/
>
> Kind regards,
> 	Sven

This patch already fixes the problem for me. I tested it on QCA988X hw
with firmware 10.2.4.

[=A0=A0 10.350919] ath10k_pci 0000:04:00.0: qca988x hw2.0 target 0x4100016c
chip_id 0x043222ff sub 0000:0000
[=A0=A0 10.350930] ath10k_pci 0000:04:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
[=A0=A0 10.351803] ath10k_pci 0000:04:00.0: firmware ver 10.2.4-1.0-00047
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 35bd9258
[=A0=A0 10.385617] ath10k_pci 0000:04:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[=A0=A0 11.536818] ath10k_pci 0000:04:00.0: htt-ver 2.1 wmi-op 5 htt-op 2
cal otp max-sta 128 raw 0 hwcrypto 1

I also did not see the 31 bit overflow after a small amount of seconds.

Survey data from wlp4s0
=A0=A0=A0 frequency:=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 2412 MHz [in use]
=A0=A0=A0 noise:=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 -65 dBm
=A0=A0=A0 channel active time:=A0=A0=A0 =A0=A0=A0 5370225 ms
=A0=A0=A0 channel busy time:=A0=A0=A0 =A0=A0=A0 924199 ms
=A0=A0=A0 channel receive time:=A0=A0=A0 =A0=A0=A0 140 ms
=A0=A0=A0 channel transmit time:=A0=A0=A0 =A0=A0=A0 0 ms

Kind regards,
Markus


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
