Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keJle-0001a4-8S
 for ath11k@lists.infradead.org; Sun, 15 Nov 2020 15:16:39 +0000
Received: by mail-qt1-x842.google.com with SMTP id f93so10864881qtb.10
 for <ath11k@lists.infradead.org>; Sun, 15 Nov 2020 07:16:37 -0800 (PST)
MIME-Version: 1.0
References: <CAJxb_EpOy-CqJhodHMcBDuOgeQoZrtims9stB4uGxz7kCz_Y7Q@mail.gmail.com>
 <877dqn3m3t.fsf@codeaurora.org>
 <CAJxb_EoTvUV3Bwq4O7DMS1AgvWD3VLq9e5Z_Y8FeGbSFxmvzbg@mail.gmail.com>
In-Reply-To: <CAJxb_EoTvUV3Bwq4O7DMS1AgvWD3VLq9e5Z_Y8FeGbSFxmvzbg@mail.gmail.com>
From: Mitchell Nordine <mitchell.nordine@gmail.com>
Date: Sun, 15 Nov 2020 16:16:25 +0100
Message-ID: <CAJxb_Eq1NemrYh+DzrOiRfagZpcF5E4de=JPuU1EhspFF2nCWA@mail.gmail.com>
Subject: Fwd: XPS 9310 MSI vectors patch for ath11k
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

Hi folks,

With Kalle's help I have managed to get wi-fi working on my XPS 13
9310 (with the QCA6390) working on NixOS.

To do this, I switched to 5.10-rc2 and applied Kalle's patch for the
XPS 9310 here[1] and installed the latest version of the firmware
following the instructions outlined here[2].

However, despite wi-fi working, with these changes my system has
become incredibly unstable, often crashing resulting in a frozen
desktop with nothing responding and no ability to switch to the other
ttys.

Occasionally however, the system will not crash, and instead the
internet will simply drop out (though with GNOME still showing the
wi-fi as "connected") with the following errors reported in
journalctl:

Nov 14 21:29:29 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
receive scan abort comple: timed out
Nov 14 21:29:29 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
abort scan: -110
Nov 14 21:30:02 mindtree wpa_supplicant[1242]: wlp86s0:
CTRL-EVENT-SCAN-FAILED ret=-11 retry=1
Nov 14 21:30:02 mindtree kernel: ath11k_pci 0000:56:00.0: wmi command
12289 timeout
Nov 14 21:30:02 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send WMI_START_SCAN_CMDID
Nov 14 21:30:02 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
start hw scan: -11
Nov 14 21:30:06 mindtree wpa_supplicant[1242]: wlp86s0:
CTRL-EVENT-SCAN-FAILED ret=-11 retry=1
Nov 14 21:30:06 mindtree kernel: ath11k_pci 0000:56:00.0: wmi command
12289 timeout
Nov 14 21:30:06 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send WMI_START_SCAN_CMDID
Nov 14 21:30:06 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
start hw scan: -11
Nov 14 21:30:10 mindtree wpa_supplicant[1242]: wlp86s0:
CTRL-EVENT-SCAN-FAILED ret=-11 retry=1
Nov 14 21:30:10 mindtree kernel: ath11k_pci 0000:56:00.0: wmi command
12289 timeout
Nov 14 21:30:10 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send WMI_START_SCAN_CMDID
Nov 14 21:30:10 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
start hw scan: -11
Nov 14 21:30:14 mindtree wpa_supplicant[1242]: wlp86s0:
CTRL-EVENT-SCAN-FAILED ret=-11 retry=1
Nov 14 21:30:14 mindtree kernel: ath11k_pci 0000:56:00.0: wmi command
12289 timeout
Nov 14 21:30:14 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send WMI_START_SCAN_CMDID
Nov 14 21:30:14 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
start hw scan: -11
Nov 14 21:30:18 mindtree wpa_supplicant[1242]: wlp86s0:
CTRL-EVENT-SCAN-FAILED ret=-11 retry=1
Nov 14 21:30:18 mindtree kernel: ath11k_pci 0000:56:00.0: wmi command
12289 timeout
Nov 14 21:30:18 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send WMI_START_SCAN_CMDID
Nov 14 21:30:18 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
start hw scan: -11

(repeats...)

If I now attempt to disable wi-fi via the GNOME menu, journalctl shows
the following:

Nov 14 21:45:38 mindtree kernel: wlp86s0: deauthenticating from
1c:b0:44:ec:96:c0 by local choice (Reason: 3=DEAUTH_LEAVING)
Nov 14 21:45:41 mindtree kernel: ath11k_pci 0000:56:00.0: wmi command
28680 timeout
Nov 14 21:45:41 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
submit WMI_MGMT_TX_SEND_CMDID cmd
Nov 14 21:45:41 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send mgmt frame: -11
Nov 14 21:45:41 mindtree kernel: ath11k_pci 0000:56:00.0: failed to tx
mgmt frame, vdev_id 0 :-11
Nov 14 21:45:43 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
flush transmit queue 0
Nov 14 21:45:46 mindtree kernel: ath11k_pci 0000:56:00.0: wmi command
24595 timeout
Nov 14 21:45:46 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send WMI_PEER_REORDER_QUEUE_SETUP
Nov 14 21:45:46 mindtree kernel: ath11k_pci 0000:56:00.0: failed to
send wmi to delete rx tid -11
Nov 14 21:45:46 mindtree kernel: wlp86s0: HW problem - can not stop rx
aggregation for 1c:b0:44:ec:96:c0 tid 0


I've also noticed that on each boot, there appear to be some errors
during ath11k_pci initialisation related to a memory request and qmi.
From dmesg:

[    4.738943] ath11k_pci 0000:56:00.0: Respond mem req failed,
result: 1, err: 0
[    4.738945] ath11k_pci 0000:56:00.0: qmi failed to respond fw mem
req:-22
[    4.739070] ath11k_pci 0000:56:00.0: req mem_seg[0] 0x5a100000
524288 1
[    4.739071] ath11k_pci 0000:56:00.0: req mem_seg[1] 0x5a180000
524288 1
[    4.739072] ath11k_pci 0000:56:00.0: req mem_seg[2] 0x5a200000
524288 1
[    4.739072] ath11k_pci 0000:56:00.0: req mem_seg[3] 0x5a280000
294912 1
                      [    4.739073] ath11k_pci 0000:56:00.0: req
mem_seg[4] 0x5a300000 524288 1
[    4.739073] ath11k_pci 0000:56:00.0: req mem_seg[5] 0x5a380000
524288 1
[    4.739074] ath11k_pci 0000:56:00.0: req mem_seg[6] 0x59c00000
458752 1
[    4.739074] ath11k_pci 0000:56:00.0: req mem_seg[7] 0x5a5c0000
131072 1
                      [    4.739075] ath11k_pci 0000:56:00.0: req
mem_seg[8] 0x59c80000 524288 4
[    4.739075] ath11k_pci 0000:56:00.0: req mem_seg[9] 0x59d00000
360448 4
                      [    4.739076] ath11k_pci 0000:56:00.0: req
mem_seg[10] 0x5a5a4000 16384 1
[    4.749134] ath11k_pci 0000:56:00.0: chip_id 0x0 chip_family 0xb
board_id 0xff soc_id 0xffffffff
[    4.749136] ath11k_pci 0000:56:00.0: fw_version 0x101c06cc
fw_build_timestamp 2020-06-24 19:50 fw_build_id


I tried the same patches and firmware on 5.10-rc3 but didn't notice
any difference in behaviour.

For the record, bluetooth still does not appear to be working, though
I'm not sure if this is expected or not at this point.

I'm on NixOS, and unfortunately I haven't yet worked out how to enable
the ath11k debugging options via `make menuconfig` in a declarative
manner for my nix configuration. That said, if there are any other
patches you would like me to test just let me know.

Btw, I tried subscribing to the ath11k mailing list today and
yesterday, but haven't received any ack or response, but maybe this is
normal over the weekend.

In case anyone is interested in following along, I have a draft PR
open at the nixos/nixos-hardware repo[3] for the Dell XPS 9310 which
includes these WIP patches. This includes a nix module for installing
the QCA6390 firmware and Kalle's patch mentioned above.

[1]: https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/
[2]: http://lists.infradead.org/pipermail/ath11k/2020-November/000537.html
[3]: https://github.com/NixOS/nixos-hardware/pull/207

Cheers,
Mitch

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
